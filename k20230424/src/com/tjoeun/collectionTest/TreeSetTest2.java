package com.tjoeun.collectionTest;

import java.util.ArrayList;
import java.util.TreeSet;
import java.util.Iterator;

public class TreeSetTest2 {
	
	public static void main(String[] args) {
		
		TreeSet<String> tset = new TreeSet<>();
		
		tset.add("이순신");
		System.out.println(tset);
		tset.add("을지문덕");
		System.out.println(tset);
		tset.add("강감찬");
		System.out.println(tset);
		tset.add("장보고");
		System.out.println(tset);
		System.out.println("========================================");
		
		ArrayList<String> list = new ArrayList<>();
		//향상된 for를 사용해서 TreeSet이나 TreeSet 객체의 데이터를 1개씩 얻어올 수 있다.
		for(String str : tset) {
			System.out.println("향상된 for 사용 : " + str);
			list.add(str);
		}
		System.out.println("========================================");
		for(int i = 0 ; i <list.size() ; i++) {
			System.out.println("일반 for 사용 : " +list.get(i));
		}
		System.out.println("========================================");
		tset.remove("이순신");
		
		/* - Iterator<E> 인터페이스는 TreeSet이나 TreeSet같이 입력되는 순서와 저장되는 순서가 달라서 get(), 
		 set() 메소드를 사용할 수 없는 객체를 분리한다.  
		 - TreeSet이나 TreeSet 객체에 literator() 메소드를 실행하면 데이터 단위로 분리된다. */ 
		Iterator<String> iterator = tset.iterator();
		
		//hasNext() 메소드는 Iterator 인터페이스 객체에 다음에 읽을 데이터가 있으면 true, 없으면 false를 리턴한다. 
		while (iterator.hasNext()) { //Iterator 인터페이스 객체에 데이터가 있는 동안 반복한다. 
			//next() 메소드는 Iterator 인터페이스 객체의 다음 데이터를 얻어온다.
			System.out.println("iterator 사용 : " + iterator.next());
		}
		System.out.println("========================================");
		
		while (iterator.hasNext()) { 
			list.add(iterator.next());
			System.out.println("iterator 사용 : " + iterator.next());
		}
		
		
		System.out.println("========================================");
		tset.remove("이순신");
	
		
		
		
		
		
	}

}
