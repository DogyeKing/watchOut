package board;

public class ReplaceHtml {
	public static String getCode(String code) {
		return code.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt").replaceAll("\n", "<br>");
	}
}
