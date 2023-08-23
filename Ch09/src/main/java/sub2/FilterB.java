package sub2;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterB implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 필터 처리될 로직 수행
		//chain - 요청에 대해서 필터가 연결됨.
		System.out.println("FilterB doFilter()...");
		
		//인코딩 처리- 필터에서 인코딩 처리를 하면 개별 페이지에서 인코딩을 따로 해주지 않아도 된다.
		request.setCharacterEncoding("UTF-8");
		
		//다음 필터 호출 - 필터가 없을 시 최종자원 요청
		chain.doFilter(request, response);
	}
	
}
