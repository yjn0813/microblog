package filters;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
//过滤器设置字符编码为utf-8
public class SetCharacterEncodingFilter implements Filter {
    protected String encoding = null;
    public void destroy() {
        this.encoding = null;
    }
    public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain)
    		throws IOException, ServletException {
       String encoding = this.encoding;
       if (encoding != null)
    	   request.setCharacterEncoding(encoding);
       //执行下一个过滤器
       chain.doFilter(request, response);
    }
    public void init(FilterConfig filterConfig) throws ServletException {
        this.encoding = filterConfig.getInitParameter("encoding");
    }
}
