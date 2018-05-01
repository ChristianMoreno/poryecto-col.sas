package conexion;

import com.sun.mail.iap.ConnectionException;
import java.sql.*;

public class Conexion{
private java.sql.Connection DBConn;
Statement stGetCount;




public Connection    Get_conexion() throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException
{
    String controlador ="com.mysql.jdbc.Driver";
    Object newInstance = Class.forName(controlador).newInstance();
    String URL_bd = "jdbc:mysql://localhost:3306/innovad";
    String usuario = "root";
    String contraseña ="";

try{
Class.forName(controlador); 
DBConn = java.sql.DriverManager.getConnection(URL_bd,usuario,contraseña);
stGetCount = DBConn.createStatement();
}
catch ( Exception e ){
System.out.println(e.getMessage());
}
return DBConn;
}

public void cerrarConexion() throws ConnectionException
{
    try {
   if (stGetCount != null) stGetCount.close();
   if (DBConn != null) DBConn.close();
   }catch (SQLException  sqle){
    throw new ConnectionException("Ha ocurrido un error al intentar cerrar la conexion con Postgres. Error:" + sqle.getMessage());                                   
    }
}

}
