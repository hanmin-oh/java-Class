package com.tjoeun.syncronizedBlockTest;

public class SyncronizedBlockTest {
	
	public static void main(String[] args) {
		
		ShareArea shareArea = new ShareArea();
		
		TransferThread transfer = new TransferThread(shareArea);
		PrintThread print = new PrintThread(shareArea);
		transfer.start();
		print.start();
		
		
	}
	
	
	
	
	
}
