<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.Random,java.io.File"%>
<%@ page import="java.util.Locale"%>
<%@ page import="org.apache.struts.Globals"%>
<%@ page import="com.landray.kmss.util.ResourceUtil"%>
<%@ page import="org.acegisecurity.ui.webapp.AuthenticationProcessingFilter"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>

<template:include ref="default.login">
	<template:replace name="head" >
        <link type="text/css" rel="stylesheet" href="${ LUI_ContextPath }/resource/style/default/login_single_random/css/login.css?s_cache=${LUI_Cache}" />
        <link type="text/css" rel="stylesheet" href="${ LUI_ContextPath }/resource/style/default/login_single_random/css/animate.css?s_cache=${LUI_Cache}" />
		<script>
			Com_IncludeFile("jquery.js");
			Com_IncludeFile("jquery.fullscreenr.js|custom.js", "style/default/login_single_random/js/");
		</script>
 	</template:replace>
	<template:replace name="body">
        <!-- 背景图片 Starts -->
        <div class="login-background-img"><img src="" id="login-bgImg" /></div>
        <script type="text/javascript">
            // 您必须指定你的背景图片的大小
            var FullscreenrOptions = { width: 1920, height: 1080, bgID: '#login-bgImg' };
            // 此处将会激活全屏背景
            jQuery.fn.fullscreenr(FullscreenrOptions);
        </script>
        <!-- 背景图片 Ends -->
        <div class="login_header">
        	<!-- <div class="login_top_bar">
        	</div> -->
            <div class="main_content">
                <!-- <span class="logo"></span> -->
            </div>
        </div>
        <div class="login_content main_content">
            <!-- 登录框 开始 -->
            <div class="login_iframe">
                <div class="header"><%=ResourceUtil.getStringValue("login.title", null, ResourceUtil.getLocale(request.getParameter("lang")))%></div>
                <ui:combin ref="login.form"></ui:combin>
                <!-- 下拉弹出窗 Starts -->
                <div class="login-dropbox">
                    <div class="login-dropbox-toggle">
                        <div class="iconbox">
                            <span class="icon-QRcode"></span>
                            <span class="icon-PC"></span>
                        </div>
                    </div>
                    <div class="login-dropbox-menu">
                        <div class="header"><%=ResourceUtil.getString(request.getSession(), "login.page.header.scan")%></div>
                        <ul class="login-dropbox-QRcode-list">
                              <li>
                                <div class="login-QRcode-box">
                                    <h4 class="title">KK5.0</h4>
                                    <div class="QRcode"><img src="${ LUI_ContextPath }/resource/style/default/login_single_random/images/code_kk5.png" /></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- 下拉弹出窗 Ends -->
                <div class="form_bottom" ><a class="link" href="javascript:void(0)" onclick="addFav();"><span></span>收藏首页</a></div>
            </div>
            <!-- 登录框 结束 -->
        </div>
        <div class="login_footer">
            <p><%=ResourceUtil.getString(request.getSession(), "login.page.footer.info")%></p>
        </div>
        <script type="text/javascript">
        <%
        	String lang = request.getParameter("lang");
			if (lang == null) {
				Locale xlocale = ((Locale) session.getAttribute(Globals.LOCALE_KEY));
				if (xlocale != null)
					lang = xlocale.getLanguage();
			}
			pageContext.setAttribute("lang", lang);
		%>
         LUI.ready(function(){
             if("${lang}" != null && "${lang}" == 'en-US'){
             	//英文环境
                 $('body').addClass('muilti_eng');
             }
         });

         // 获取随机登录图片信息，返回随机获取的图片名称
         function get_random_bg() {
			<%
				String path = request.getSession().getServletContext().getRealPath("/");
				path = path.replaceAll("\\\\", "/");
				if (!path.endsWith("/")) {
					path += "/";
				}
				String filePath = path + "resource/style/default/login_single_random/login_bg";
				File file = new File(filePath);
				Random random = new Random();
				File[] files = file.listFiles();
				// 随机获取一张图片
				File bg = files[random.nextInt(files.length)];
				out.write("return \"" + bg.getName() + "\";");
			%>
         }
         function addFav(){
        	 console.log("-----------");
        	 var siteUrl=window.location.href;
        	 var siteName="EKP";
        	 if(document.all){                     
        		window.external.addFavorite(siteUrl,siteName);                
        	}else if(window.sidebar){                      
        		 window.sidebar.addPanel(siteName, siteUrl,'');         
        	}          
        	  
         }
        </script>
	</template:replace>
</template:include>

