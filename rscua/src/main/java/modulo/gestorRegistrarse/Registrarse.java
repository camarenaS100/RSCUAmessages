package modulo.gestorRegistrarse;

public class Registrarse {
    private String nombre;
    private String username;
    private String phone;
    private String email;
    private String password;

    public Registrarse(
            String nombre, String username,
            String phone, String email, String password){
        this.nombre = nombre;
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
