package com.green.tonicbank.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.PriorityQueue;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.tonicbank.dao.ProductDao;
import com.green.tonicbank.model.Product;
@Service
public class ProductService {
	@Autowired
	ProductDao pdao;
	
	public List<List<Product>> getCustom(String tag,int min,int max)throws Exception{
		String []arr;
		arr=tag.split(",");
		
		int idx=0;
		
		List<Product>result=new ArrayList<Product>();
		HashSet<String>set=new HashSet<>();
		for(int i=0;i<arr.length;i++) {
			List<Product> list  = pdao.custom(arr[i]);
			for(int j=0;j<list.size();j++) {
				Product now = list.get(j);
				if(set.contains(now.getName())) continue;
				set.add(now.getName());
				result.add(now);
			}
		}
		PriorityQueue<Product>pq=new PriorityQueue<Product>((o1,o2)->{
			return o2.getCost()-o1.getCost();
		});
		
		List<Product>realResult=new ArrayList<Product>();
		
		for(int i=0;i<result.size();i++) {
			Product now=result.get(i);
			String str=now.getEfficacy();
			for(int j=0;j<arr.length;j++) {
				if(str.contains(arr[j])) {
					now.setCost(now.getCost()+(10-i)/5);
				}
			}
			pq.offer(now);
		}
		while(!pq.isEmpty()) {
			realResult.add(pq.poll());
		}
		while(realResult.size()>2&&realResult.size()%3!=0) {
			realResult.remove(realResult.size()-1);
		}
		
		List<Product>last[]=new ArrayList[realResult.size()];
		for(int i=0;i<realResult.size();i++) {
			last[i]=new ArrayList<Product>();
		}
		int sum=0;
		for(int i=0;i<realResult.size();i++) {
			if(i!=0&&i%3==0) {
				idx++;
			}
			last[idx].add(realResult.get(i));
		}
		for(int i=0;i<last.length;i++) {
			sum=0;
			for(int j=0;j<last[i].size();j++) {
				sum+=last[i].get(j).getPrice();
			}
			if(sum<min || sum>max) {
				last[i].clear();
			}
		}
		List <List<Product>>res=new ArrayList<>();
		for(int i=0;i<last.length;i++) {
			if(last[i].isEmpty())continue;
			res.add(last[i]);
		}
		
		return res;
		
	}
}
