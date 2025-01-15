package servicios;

import java.sql.*;

public class Conexion {

    private Connection con;
    private Statement st;
    private ResultSet rs;

    public Conexion() {
        String url = "jdbc:mysql://localhost:3306/rscua";
        System.out.println("\n" + url);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("\nJDBC Driver no encontrado");
            throw new RuntimeException(e);
        }

        try {
            con = DriverManager.getConnection(url, "root", "rHQKUcA3XE");
        } catch (SQLException e) {
            System.out.println("\nError al conectar con URL a la base de datos");
            throw new RuntimeException(e);
        }

        System.out.println("\n\nConexion establecida");
    }

    // Getter to obtain the underlying connection
    public Connection getConexion() {
        return con;
    }

    public void ejecutar(String query) throws SQLException {
        st = con.createStatement();
        st.executeUpdate(query);
        st.close();
    }

    public ResultSet ejecutarSelect(String query) throws SQLException {
        st = con.createStatement();
        rs = st.executeQuery(query);
        return rs;
    }

    public void desconectar() throws SQLException {
        con.close();
    }
}
