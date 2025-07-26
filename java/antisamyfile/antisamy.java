package antisamyfile;


import org.owasp.validator.html.AntiSamy;
import org.owasp.validator.html.CleanResults;
import org.owasp.validator.html.Policy;
import org.owasp.validator.html.PolicyException;
import org.owasp.validator.html.ScanException;

public class antisamy {
	

public static String safe(String html) throws ScanException, PolicyException {

	  
	  Policy policy = Policy.getInstance(AntiSamy.class.getResourceAsStream("/antisamy-tinymce.xml"));
	  AntiSamy antiSamy = new AntiSamy();
	  CleanResults cleanResults = antiSamy.scan(html, policy);
	  return cleanResults.getCleanHTML().trim();
	}
}