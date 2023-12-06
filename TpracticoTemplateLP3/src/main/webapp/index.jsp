
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate, max-age=0, post-check=0, pre-check=0">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="0">
        <title>Login - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">


        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                        <!-- <form action="UsuarioDTO" method="post"> -->
                                        <form method="post" action="Controlador?accion=login">               
                                            <%-- Verificar si se ha enviado un correo electrónico con éxito --%>
                                            <% Boolean emailEnviadoExitosamente = (Boolean) request.getAttribute("emailEnviadoExitosamente");
                                                if (emailEnviadoExitosamente != null && emailEnviadoExitosamente) { %>
                                            <div class="alert alert-success" role="alert">Correo de Reset enviado con éxito.</div>
                                            <% } %>


                                            <% Boolean creadoSuccess = (Boolean) session.getAttribute("creadoSuccess");
                                                if (creadoSuccess != null && creadoSuccess) { %>
                                            <div class="alert alert-success" role="alert">Registrado con exito, ya te puedes loguear!</div>   
                                            <% session.removeAttribute("creadoSuccess"); // Limpiar el atributo
                                                } %>



                                            <%
                                                String mensajeError = (String) request.getAttribute("mensajeError");
                                                if (mensajeError != null) {
                                            %>
                                            <div class="alert alert-danger" role="alert"> Acceso denegado. Inténtalo nuevamente. </div>
                                            <%
                                                }
                                            %>

                                            <%
                                                HttpSession sesion = request.getSession();
                                                if (request.getParameter("sesion") != null) {
                                                    sesion.invalidate();
                                                }
                                            %>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputEmail" name="inputEmail" type="email" placeholder="name@example.com" />
                                                <label for="inputEmail">Email address</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" name="inputPassword" type="password" placeholder="Password" />
                                                <label for="inputPassword">Password</label>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                                <label class="form-check-label" for="inputRememberPassword">Remember Password</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="password.jsp">Forgot Password?</a>
                                                <button type="submit" name="accion" value="Login" class="btn btn-primary btn-lg"
                                                        style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>      
                                                <!-- comment <a class="btn btn-primary" href="index.jsp">Login</a>-->
                                            </div>

                                        </form>

                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="register.jsp">Need an account? Sign up!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>

