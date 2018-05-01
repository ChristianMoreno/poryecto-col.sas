/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package conexion;

import com.sun.mail.iap.ConnectionException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Logica {
    
public  java.sql.Connection DBConn;
public  java.sql.Connection close;
private java.sql.Connection GetConexion;
public ResultSet rs;
Statement stGetCount;
private int rst;
ResultSet hay;

public  ResultSet  ConsultaSQLClave(String identificacion,String clave) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException, ConnectionException
{
Conexion conexion = new Conexion();   
 try {
  DBConn = conexion.Get_conexion();
  stGetCount = DBConn.createStatement();
  String consulta="select * from usuarios  where identificacion='"+identificacion+"' and clave='"+clave+"'";
  rs = stGetCount.executeQuery(consulta);
  System.out.println("CONSULTA EXITOS");
     System.out.println(identificacion);
     System.out.println(clave);
  }catch (SQLException e) {
    
  System.out.println("No puede Ejecutar la consulta :");
 }finally {
          // conexion.cerrarConexion();
          }
 
 return rs;
}
public  ResultSet  ModificarSQLClave(String id_tipo_documento,String identificacion,String nombre,String apellido,String fecha_nacimiento,String correo,String telefono, String clave, String id_rol ) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException, ConnectionException
{
Conexion conexion = new Conexion();   
 try {
  DBConn = conexion.Get_conexion();
  stGetCount = DBConn.createStatement();
  String modificar="update cliente set id_tipo_documento='"+id_tipo_documento+"',nombre='"+nombre+"',apellido='"+apellido+"', fecha_nacimiento='"+fecha_nacimiento+", correo='"+correo+", telefono='"+telefono+"', clave='"+clave+", id_rol='"+id_rol+"' where='"+identificacion+"'";
  rs = stGetCount.executeQuery(modificar);
  }catch (SQLException e) {
  System.out.println("No puede modificar la tabla :");
  System.out.println(e);
 }finally {
          // conexion.cerrarConexion();
          }
 
 return rs;
}

public  ResultSet  ConsultaGeneralSQL(String consulta) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException, ConnectionException
{
Conexion conexion = new Conexion();   
try {
  DBConn = conexion.Get_conexion();
  stGetCount = DBConn.createStatement();
  rs = stGetCount.executeQuery(consulta);
  }catch (SQLException e) {
  System.out.println("No puede Ejecutar la consulta :" + consulta);
 }finally {
           //conexion.cerrarConexion();
          }
return rs;
}

public  int ModificarGeneralSQL(String modificar) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException, ConnectionException
{
Conexion conexion = new Conexion();   
try {
  DBConn = conexion.Get_conexion();
  stGetCount = DBConn.createStatement();
  rst = stGetCount.executeUpdate(modificar);
  }catch (SQLException e) {
  System.out.println("No puede modificar la tabla" + modificar);
  System.out.println(e);
 }finally {
           //conexion.cerrarConexion();
          }
  return rst;
}

public   int InsertarGeneralSQL(String insertar) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException, ConnectionException
{
 Conexion conexion = new Conexion();   
  try {
  DBConn = conexion.Get_conexion();
  stGetCount = DBConn.createStatement();
  rst = stGetCount.executeUpdate(insertar);
   }catch (SQLException e) {
   System.out.println("No SE PUEDE INSERTAR EN LA TABLA:" + insertar);
      System.out.println(e);
      
   }finally {
 	    //conexion.cerrarConexion();
            }
   return rst;
  }

public  int  DeleteGeneralSQL(String borrar) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException, ConnectionException
{
  Conexion conexion = new Conexion();   
  try {
  DBConn = conexion.Get_conexion();
  stGetCount = DBConn.createStatement();
  rst = stGetCount.executeUpdate(borrar);
  }catch (SQLException e) {
      
  System.out.println("No puede Ejecutar la consulta : " + borrar);
      System.out.println(e);
 }finally {
 	   conexion.cerrarConexion();
	   }
return  rst;
}
}
