package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class FilterTest implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)	throws IOException, ServletException {
		
		System.out.println("필터 수행 처리 전 입니다.");
		
		chain.doFilter(request, response);
		
		System.out.println("필터 수행 처리 후 입니다.");
		
	}

}
