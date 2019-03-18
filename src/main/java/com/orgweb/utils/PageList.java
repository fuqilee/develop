package com.orgweb.utils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

/**
 *
 * @explain: 分页实体
 *
 * @author Tasen
 */
@SuppressWarnings("rawtypes")
public class PageList<T> implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 5039088351775019977L;

	private List<T> list;
	
	private T page;

	/** 总页数 */
	private int totalPage = 1;

	/** 当前页 */
	private int curPage = 1;
	
	private int startIndex;

	/** 当前页面的大小 */
	private int pageSize=10;

	/** 总记录数 */
	private int totalCount = 0;

	private int nextPage = 1;

	private int prePage = 1;

	private String params = "";
	private String base = "curPage=";
	private String url;
	
	private RowBounds rowBounds ;
	
	

	public RowBounds getRowBounds() {
		return rowBounds;
	}

	public void setRowBounds(RowBounds rowBounds) {
		this.rowBounds = rowBounds;
	}

	public T getPage() {
		return page;
	}

	public void setPage(T page) {
		this.page = page;
	}

	public PageList() {
		list = new ArrayList<T>();
	}
	public PageList (int curPage , int pageSize){ 
		
		if(curPage <=0 )
			this.curPage = 1;
		else
			this.curPage = curPage;
		this.pageSize=pageSize;
		rowBounds =new RowBounds(this.getStartIndex(),pageSize);
	}

	public String getParams() {
		return params.equals("") ? "" : params + "&";
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getFirst() {
		return url + getParams() + base + 1;
	}

	public String getNext() {
		return url + getParams() + base + getNextPage();
	}

	public String getPre() {
		return url + getParams() + base + getPrePage();
	}

	public String getLast() {
		return url + getParams() + base + getTotalPage();
	}

	public String getBase() {
		return url + getParams() + base;
	}

	public String getBase(int curPage) {
		return url + getParams() + base + curPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url + "?";
	}
	
	
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getStartIndex() {
		int pageNum = this.getCurPage() > 0 ? this.getCurPage() - 1 : 0;
		return pageNum * this.getPageSize();
	}

	public int getNextPage() {
		if (curPage >= totalPage) {
			this.nextPage = curPage;
		} else {
			this.nextPage = this.curPage + 1;
		}
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPrePage() {
		if (curPage <= 1) {
			this.prePage = 1;
		} else {
			this.prePage = curPage - 1;
		}
		return prePage;
	}

	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}

	public List getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getTotalPage() {
		this.totalPage = (int)Math.ceil(Double.valueOf(String.valueOf(this.totalCount)) / Double.valueOf(String.valueOf(this.pageSize)));
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		if(totalPage <= 0)
			this.totalPage = 1;
		else
			this.totalPage = totalPage;
		
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		if(curPage <=0 )
			this.curPage = 1;
		else
			this.curPage = curPage;
		rowBounds =new RowBounds(this.getStartIndex(),pageSize);
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

}
