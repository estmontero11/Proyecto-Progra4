package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class prueba_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("\t<title>Map</title>\n");
      out.write("\t<style>\n");
      out.write("#myMap {\n");
      out.write("   height: 350px;\n");
      out.write("   width: 680px;\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("<script src=\"https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false\">\n");
      out.write("</script>\n");
      out.write("<script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js\">\n");
      out.write("</script>\n");
      out.write("<script type=\"text/javascript\"> \n");
      out.write("var map;\n");
      out.write("var marker;\n");
      out.write("var myLatlng = new google.maps.LatLng(20.268455824834792,85.84099235520011);\n");
      out.write("var geocoder = new google.maps.Geocoder();\n");
      out.write("var infowindow = new google.maps.InfoWindow();\n");
      out.write("function initialize(){\n");
      out.write("var mapOptions = {\n");
      out.write("zoom: 18,\n");
      out.write("center: myLatlng,\n");
      out.write("mapTypeId: google.maps.MapTypeId.ROADMAP\n");
      out.write("};\n");
      out.write("\n");
      out.write("map = new google.maps.Map(document.getElementById(\"myMap\"), mapOptions);\n");
      out.write("\n");
      out.write("marker = new google.maps.Marker({\n");
      out.write("map: map,\n");
      out.write("position: myLatlng,\n");
      out.write("draggable: true \n");
      out.write("}); \n");
      out.write("\n");
      out.write("geocoder.geocode({'latLng': myLatlng }, function(results, status) {\n");
      out.write("if (status == google.maps.GeocoderStatus.OK) {\n");
      out.write("if (results[0]) {\n");
      out.write("$('#latitude,#longitude').show();\n");
      out.write("$('#address').val(results[0].formatted_address);\n");
      out.write("$('#latitude').val(marker.getPosition().lat());\n");
      out.write("$('#longitude').val(marker.getPosition().lng());\n");
      out.write("infowindow.setContent(results[0].formatted_address);\n");
      out.write("infowindow.open(map, marker);\n");
      out.write("}\n");
      out.write("}\n");
      out.write("});\n");
      out.write("\n");
      out.write("google.maps.event.addListener(marker, 'dragend', function() {\n");
      out.write("\n");
      out.write("geocoder.geocode({'latLng': marker.getPosition()}, function(results, status) {\n");
      out.write("if (status == google.maps.GeocoderStatus.OK) {\n");
      out.write("if (results[0]) {\n");
      out.write("$('#address').val(results[0].formatted_address);\n");
      out.write("$('#latitude').val(marker.getPosition().lat());\n");
      out.write("$('#longitude').val(marker.getPosition().lng());\n");
      out.write("infowindow.setContent(results[0].formatted_address);\n");
      out.write("infowindow.open(map, marker);\n");
      out.write("}\n");
      out.write("}\n");
      out.write("});\n");
      out.write("});\n");
      out.write("\n");
      out.write("}\n");
      out.write("google.maps.event.addDomListener(window, 'load', initialize);\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div id=\"myMap\"></div>\n");
      out.write("<input id=\"address\" type=\"text\" style=\"width:600px;\"/><br/>\n");
      out.write("<input type=\"text\" id=\"latitude\" placeholder=\"Latitude\"/>\n");
      out.write("<input type=\"text\" id=\"longitude\" placeholder=\"Longitude\"/>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
