ALTER TABLE Soporte DROP CONSTRAINT FKSoporte341939;
ALTER TABLE Cliente DROP CONSTRAINT FKCliente380167;
ALTER TABLE Tecnico DROP CONSTRAINT FKTecnico399867;
ALTER TABLE Administrador DROP CONSTRAINT FKAdministra935431;
ALTER TABLE Persona DROP CONSTRAINT FKPersona513389;
ALTER TABLE Usuario__Rol DROP CONSTRAINT FKUsuario__R990660;
ALTER TABLE Diagnostico DROP CONSTRAINT Diagnostico_Admin;
ALTER TABLE Equipo DROP CONSTRAINT FK_Cliente_Equipo;
ALTER TABLE Equipo DROP CONSTRAINT FK_Equipo_Categoria;
ALTER TABLE Usuario DROP CONSTRAINT FK_Persona_Usuario;
ALTER TABLE Diagnostico DROP CONSTRAINT ID_Equipo;
ALTER TABLE Soporte DROP CONSTRAINT Soporte_Personas;
ALTER TABLE Usuario__Rol DROP CONSTRAINT Usuario_rol;
DROP TABLE IF EXISTS Administrador CASCADE;
DROP TABLE IF EXISTS Categoria CASCADE;
DROP TABLE IF EXISTS Cliente CASCADE;
DROP TABLE IF EXISTS Diagnostico CASCADE;
DROP TABLE IF EXISTS Equipo CASCADE;
DROP TABLE IF EXISTS Persona CASCADE;
DROP TABLE IF EXISTS Soporte CASCADE;
DROP TABLE IF EXISTS Tecnico CASCADE;
DROP TABLE IF EXISTS Tipo_Documento CASCADE;
DROP TABLE IF EXISTS Usuario__Rol CASCADE;
