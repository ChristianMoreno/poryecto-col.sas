/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import conexion.Conexion;
import conexion.Logica;
import com.sun.mail.iap.ConnectionException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author USUARIO
 */
@WebServlet(name = "miservlet", urlPatterns = {"/Usuarios"})
public class miservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, ConnectionException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            String Identificacion =request.getParameter("Identificacion");
            Logica Conexion = new Logica();
            String consulta= "select u.nombre estudiante, m.nombre materias, a.descripcion actividad,  au.nota nota from materias m\n" +
"INNER JOIN materias_curso mc ON m.id_materia=mc.id_materia INNER JOIN actividades a \n" +
"ON mc.id_materia_curso=a.id_materia_curso INNER JOIN actividades_usuario au \n" +
"ON a.id_actividad=au.id_actividad INNER JOIN usuarios u ON au.id_usuario=u.id_usuario where u.identificacion = '"+Identificacion+"'";
            ResultSet rs= Conexion.ConsultaGeneralSQL(consulta);
        
        
        
            
            out.println("<!DOCTYPE html>");
            
            out.println("<html>");
            out.println("<head>");
            out.println("</head>");
            out.println("<body>");
            out.println("<title>Servlet miservlet</title>"); 
           // out.println("<h1>Servlet miservlet at " + request.getContextPath() + "</h1>");
            out.println("<h1>CONSULTA</h1>");
            out.println("<table border=1 width =100%>");
            out.println("<TR>");
            out.println("<TD><font size =3 color =red>estudiante</TD>");
            out.println("<TD><font size =3 color =red>materias</TD>");
            out.println("<TD><font size =3 color =red>actividad</TD>");
            out.println("<TD><font size =3 color =red>nota</TD>");
           
            
            out.println("<TR/>");
            
            
            while(rs.next()){
       String estudiante=rs.getString(1);
       String materias=rs.getString(2);
       String actividad =rs.getString(3);
       String nota=rs.getString(4);
       
       
       
       
       
       
       
       
       
       
           out.println ("<TR>");
           out.println ("<TD>"+estudiante+"</TD>");
           out.println ("<TD>"+materias+"</TD>");
           out.println ("<TD>"+actividad+"</TD>");
           out.println ("<TD>"+nota+"</TD>");
           
           
           
          
           
           
           out.println("<TR/>");
        
          }
            
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(miservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(miservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(miservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(miservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ConnectionException ex) {
            Logger.getLogger(miservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(miservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(miservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(miservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(miservlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ConnectionException ex) {
            Logger.getLogger(miservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
