package sub2;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterA implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 필터 처리될 로직 수행
		//chain - 요청에 대해서 필터가 연결됨.
		System.out.println("FilterA doFilter()...");
		
		//다음 필터 호출 - 필터가 없을 시 최종자원 요청
		chain.doFilter(request, response);
	}
	
}
