package kr.co.dnBook.vo;

public class BoardFileVO {

    private int fileNo;
    private int boardNo;
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

    public void setBoardNo(int boardNo) { 
        this.boardNo = boardNo;
    }

    public int getBoardNo() { 
        return boardNo;
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
