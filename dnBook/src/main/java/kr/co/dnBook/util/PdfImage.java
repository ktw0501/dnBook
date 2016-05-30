package kr.co.dnBook.util;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

import javax.imageio.ImageIO;

import com.sun.pdfview.PDFFile;
import com.sun.pdfview.PDFPage;

/*
 * 아직 수정안함 
 * pdf 파일 또는 경로를 받아 이미지파일로 변환하고 이미지파일이 들어있는 디렉토리의 경로를 반환
 */
public class PdfImage {
	public static String execute(File PDFFileDir,String pdfFileName) throws IOException {
		// load a pdf from a byte buffer
		// 이미지파일이 저장될 디렉토리 생성
		File file = new File(PDFFileDir,pdfFileName);
		File nDir = new File(PDFFileDir,"imgs");
		nDir.mkdirs();
		
		//파일정보 받아서 pdf파일 객체로 변환
		RandomAccessFile raf = new RandomAccessFile(file, "r");
		FileChannel channel = raf.getChannel();
		ByteBuffer buf = channel.map(FileChannel.MapMode.READ_ONLY, 0, channel.size());
		PDFFile pdffile = new PDFFile(buf);
		
		

		for (int i = 1; i <= pdffile.getNumPages(); i++) {

			// draw the first page to an image

			PDFPage page = pdffile.getPage(i);

			// get the width and height for the doc at the default zoom
			Rectangle rect = new Rectangle(0, 0, (int) page.getBBox().getWidth(), (int) page.getBBox().getHeight());

			// generate the image

			Image image = page.getImage(rect.width, rect.height, // width &
																	// height
					rect, // clip rect
					null, // null for the ImageObserver
					true, // fill background with white
					true // block until drawing is done
			);

			int w = image.getWidth(null);
			int h = image.getHeight(null);
			BufferedImage bi = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
			Graphics2D g2 = bi.createGraphics();
			g2.drawImage(image, 0, 0, null);
			g2.dispose();
			try {
				ImageIO.write(bi, "jpg", new File(nDir,file.getName()+"Page"+i+".jpg"));
			} catch (IOException ioe) {
				System.out.println("write: " + ioe.getMessage());
			}
			
		}
		return nDir.getPath();
	}
}
