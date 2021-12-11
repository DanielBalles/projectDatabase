CREATE TABLE Administrador (ID_Administrador SERIAL NOT NULL, PersonaID_persona int4 NOT NULL, PRIMARY KEY (ID_Administrador));
CREATE TABLE Categoria (ID_Categoria SERIAL NOT NULL, Nombre_Categoria varchar(20) NOT NULL UNIQUE, PRIMARY KEY (ID_Categoria));
CREATE TABLE Cliente (ID_Cliente SERIAL NOT NULL, PersonaID_persona int4 NOT NULL, PRIMARY KEY (ID_Cliente));
CREATE TABLE Diagnostico (ID_Diagnostico int4 NOT NULL, Num_Diagnostico int4, Descripcion_Diag varchar(200), ID_Administrador int4, ID_Equipo int4, PRIMARY KEY (ID_Diagnostico));
CREATE TABLE Equipo (ID_Equipo SERIAL NOT NULL, ID_Cliente int4, ID_Categoria int4, Marca varchar(20) UNIQUE, Num_Serie int4, Modelo varchar(20) NOT NULL UNIQUE, Precio int4, PRIMARY KEY (ID_Equipo));
CREATE TABLE Persona (ID_persona SERIAL NOT NULL, Nombre1 varchar(255) NOT NULL, Nombre2 varchar(255), Apellido1 varchar(255) NOT NULL, Apellido2 varchar(255), Celular int4 NOT NULL, Correo int4 NOT NULL, Tipo_DocumentoID_TipoDoc int4 NOT NULL, PRIMARY KEY (ID_persona));
CREATE TABLE Soporte (ID_Soporte SERIAL NOT NULL, FechaDeIngreso int4 NOT NULL, FechaDeSalida int4, ID_Tecnico int4, DiagnosticoID_Diagnostico int4 NOT NULL, PRIMARY KEY (ID_Soporte));
CREATE TABLE Tecnico (ID_Tecnico SERIAL NOT NULL, PersonaID_persona int4 NOT NULL, PRIMARY KEY (ID_Tecnico));
CREATE TABLE Tipo_Documento (ID_TipoDoc SERIAL NOT NULL, Nombre_Tipodoc varchar(25) NOT NULL UNIQUE, PRIMARY KEY (ID_TipoDoc));
CREATE TABLE Usuario__Rol (ID_Usuario int4 NOT NULL, RolID_Rol int4 NOT NULL, PRIMARY KEY (ID_Usuario, RolID_Rol));
ALTER TABLE Soporte ADD CONSTRAINT FKSoporte341939 FOREIGN KEY (DiagnosticoID_Diagnostico) REFERENCES Diagnostico (ID_Diagnostico);
ALTER TABLE Cliente ADD CONSTRAINT FKCliente380167 FOREIGN KEY (PersonaID_persona) REFERENCES Persona (ID_persona);
ALTER TABLE Tecnico ADD CONSTRAINT FKTecnico399867 FOREIGN KEY (PersonaID_persona) REFERENCES Persona (ID_persona);
ALTER TABLE Administrador ADD CONSTRAINT FKAdministra935431 FOREIGN KEY (PersonaID_persona) REFERENCES Persona (ID_persona);
ALTER TABLE Persona ADD CONSTRAINT FKPersona513389 FOREIGN KEY (Tipo_DocumentoID_TipoDoc) REFERENCES Tipo_Documento (ID_TipoDoc);
ALTER TABLE Usuario__Rol ADD CONSTRAINT FKUsuario__R990660 FOREIGN KEY (RolID_Rol) REFERENCES Rol (ID_Rol);
ALTER TABLE Diagnostico ADD CONSTRAINT Diagnostico_Admin FOREIGN KEY (ID_Administrador) REFERENCES Administrador (ID_Administrador);
ALTER TABLE Equipo ADD CONSTRAINT FK_Cliente_Equipo FOREIGN KEY (ID_Cliente) REFERENCES Cliente (ID_Cliente);
ALTER TABLE Equipo ADD CONSTRAINT FK_Equipo_Categoria FOREIGN KEY (ID_Categoria) REFERENCES Categoria (ID_Categoria);
ALTER TABLE Usuario ADD CONSTRAINT FK_Persona_Usuario FOREIGN KEY (PersonaID_persona) REFERENCES Persona (ID_persona);
ALTER TABLE Diagnostico ADD CONSTRAINT ID_Equipo FOREIGN KEY (ID_Equipo) REFERENCES Equipo (ID_Equipo);
ALTER TABLE Soporte ADD CONSTRAINT Soporte_Personas FOREIGN KEY (ID_Tecnico) REFERENCES Tecnico (ID_Tecnico);
ALTER TABLE Usuario__Rol ADD CONSTRAINT Usuario_rol FOREIGN KEY (ID_Usuario) REFERENCES Usuario (ID_Usuario);
