<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDB" scope="page" class="beans.connDB"/>
<jsp:useBean id="chStr" scope="page" class="beans.chStr"/>
<jsp:include page="safe.jsp"/>
<%
if (request.getParameter("ISBN")!=null){
	String ISBN=request.getParameter("ISBN");
	ResultSet rs=connDB.executeQuery("select * from tb_bookinfo where ISBN='"+ISBN+"'");
	String bookname="";
	String Type="";
	String TPI="";
	String author="";
	String intro="";
	String pDate="";
	String cover="";
	float price=0;
	int commend=0;
	int newbook=0;
	if(!rs.next()){
		out.println("<script lanuage='javascript'>alert('���Ĳ�������!');window.location.href='index.jsp';</script>");
	}else{
		bookname=rs.getString("bookname");
		Type=rs.getString("Type");
		TPI=rs.getString("publisher");
		author=rs.getString("writer");
		intro=rs.getString("introduce");		
		price=rs.getFloat("Price");				
		pDate=rs.getString("pDate");
		cover=rs.getString("cover");
		newbook=rs.getInt("newbook");		
		commend=rs.getInt("commend");
	}
%>
<html>
<head>
<title>����ͼ�鳬��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../CSS/style.css" rel="stylesheet">
<script src="../JS/check.jsp"></script>
</head>
<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0" background="../Images/bg.gif">
  <tr>
    <td>
<table width="777" height="609"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top">
	<jsp:include page="Top.jsp"/>
	<table width="100%"  border="0" cellspacing="0" cellpadding="0" class="tableBorder_LTR">
      <tr>
        <td height="30" align="center" bgcolor="#eeeeee">�ԡԡ� <a href="index.jsp">ͼ�����</a> �ԡԡ�</td>
      </tr>
    </table>
	<table width="100%" height="396"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LBR">
        <tr>
          <td width="26%" height="395" valign="top"><table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="55%" height="82" align="center" class="word_grey">&nbsp;<img src="../Images/reg.gif" width="84" height="54"></td>
              <td width="45%" align="left" class="word_grey">ɾ��ͼ����Ϣ</td>
            </tr>
            <tr>
              <td height="112" colspan="2" valign="top" class="word_grey"><ul>
                  <li> ��ţ�ͼ���ISBN�������������ȷ��������޸ġ�</li>
                  <li>�������ڣ�����������״η��е����ڣ���2005��10�¡�</li>
                  <li>�����ļ������Ƚ�ͼ��ķ����ļ����浽վ���manage\cover�ļ����£��������ļ������ɣ�������չ�����磺JSPxxxtkfaljx.jpg��</li>
                  <li>�Ƿ��Ƽ���ѡ���ǡ���ͼ����Ϣ����ʾ����վ����ҳ�С�</li>
                  <li>�Ƿ����飺ѡ���ǡ���ͼ����Ϣ����ʾ�ڡ������ϼܡ��С�</li>
                  </ul></td>
            </tr>
            <tr align="center">
              <td colspan="2" valign="middle" class="word_grey"></td>
            </tr>
          </table></td>
          <td width="5" valign="top" background="../Images/Cen_separate.gif"></td>
          <td width="73%" valign="top"><table width="100%" height="56"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td align="center">&nbsp;</td>
            </tr>
            <tr>
              <td align="center">
			  <form action="book_del_deal.jsp" method="post" name="form1">
			    <table width="100%"  border="0" align="center" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td width="14%" height="27">&nbsp;�顡���ţ�</td>
                    <td height="27">&nbsp;
                      <input name="ISBN" type="text" class="Sytle_text" id="bookID2" readonly="yes" value="<%=ISBN%>">
</td>
                    <td height="27">&nbsp;�顡������</td>
                    <td height="27">&nbsp;
                          <input name="bookname" type="text" class="Style_upload" id="bookname2" value="<%=bookname%>">
                    </td>
                  </tr>
                  <tr>
                    <td height="27">&nbsp;�������ߣ�</td>
                    <td width="25%" height="27">&nbsp;
                          <input name="writer" type="text" class="Style_upload" id="writer" value="<%=author%>">
                    </td>
                    <td width="15%" height="27"> &nbsp;������ƣ�</td>
                    <td width="46%" height="27">&nbsp;
                          <input name="type" type="text" class="Sytle_text" id="zishu2" value="<%=Type%>">
                    </td>
                  </tr>
                  <tr>
                    <td height="27">&nbsp;��&nbsp;��&nbsp;�磺</td>
                    <td height="27">&nbsp;
                          <input name="TPI" type="text" class="Style_upload" id="TPI" value="<%=TPI%>">
                    </td>
                    <td height="27">&nbsp;�������ڣ�</td>
                    <td height="27">&nbsp;
                          <input name="pDate" type="text" class="Sytle_text" id="pDate" value="<%=pDate%>">
                   </td>
                  </tr>
                  <tr>
                    <td height="41">&nbsp;�����ļ���</td>
                    <td height="41">&nbsp;
                          <input name="cover" type="text" class="Style_upload" id="cover" value="<%=cover%>">
                    </td>
                    <td height="41">&nbsp;�ۡ�����</td>
                    <td height="41">&nbsp;
                          <input name="price" type="text" class="Sytle_text" id="price" value="<%=price%>">
      (Ԫ)</td>
                  </tr>
                  <tr>
                    <td height="45">&nbsp;�Ƿ��Ƽ���</td>
                    <td>&nbsp; <input name="commend" type="radio" class="noborder" value="1" <%if(commend==1){out.print(" checked");}%>>
��
  <input name="commend" type="radio" class="noborder" value="0" <%if(commend==0){out.print(" checked");}%>>
��</td>
                    <td>&nbsp;�Ƿ����飺</td>
                    <td><input name="newbook" type="radio" class="noborder" value="1" <%if(newbook==1){out.print(" checked");}%>>
��
  <input name="newbook" type="radio" class="noborder" value="0"  <%if(newbook==0){out.print(" checked");}%>>
��</td>
                  </tr>
                  <tr>
                    <td height="103">&nbsp;ͼ���飺</td>
                    <td colspan="3"><span class="style5">&nbsp; </span>
                        <textarea name="introduce" cols="60" rows="5" class="textarea" id="introduce"><%=intro%></textarea></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="4" align="center">
                        <input name="Submit" type="submit" class="btn_grey" value="ȷ��">
&nbsp;                        
                        &nbsp;
                        <input name="Submit3" type="button" class="btn_grey" value="����" onClick="JScript:history.back()">
                    </td>
                  </tr>
                </table>
			  </form>
			  </td>
            </tr>
          </table></td>
        </tr>
      </table>
      <jsp:include page="copyright.jsp"/>
    </td>
  </tr>
</table>
</td>
  </tr>
</table>
</body>
</html>
<%
}else{
	out.println("<script lanuage='javascript'>alert('���Ĳ�������!');window.location.href='inde.jsp';</script>");
}%>