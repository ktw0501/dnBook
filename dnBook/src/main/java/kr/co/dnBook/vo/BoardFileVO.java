package kr.co.dnBook.vo;

public class BoardFileVO {

    private int fileNo;
    private int no;
    private String filePath;
    private String oriFileName;
    private String realFileName;
    private long fileSize;

    public void setFileNo(int fileNo) { 
        this.fileNo = fileNo;
    }

    public int getFileNo() { 
        return fileNo;
    }

    public void setNo(int no) { 
        this.no = no;
    }

    public int getNo() { 
        return no;
    }

    public void setFilePath(String filePath) { 
        this.filePath = filePath;
    }

    public String getFilePath() { 
        return filePath;
    }

    public void setOriFileName(String oriFileName) { 
        this.oriFileName = oriFileName;
    }

    public String getOriFileName() { 
        return oriFileName;
    }

    public void setRealFileName(String realFileName) { 
        this.realFileName = realFileName;
    }

    public String getRealFileName() { 
        return realFileName;
    }

    public void setFileSize(long fileSize) { 
        this.fileSize = fileSize;
    }

    public long getFileSize() { 
        return fileSize;
    }
}
