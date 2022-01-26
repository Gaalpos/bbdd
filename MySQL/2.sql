create table if not exists Hoteles(
nbHotel varchar(30)primary key,
direccion varchar(50) not null,
telefono int not null)engine = InnoDB;

create table if not exists Salas(
nbHotel varchar(30) not null,
idSala int not null,
medios varchar(30) not null,
capacidad  int not null,
primary key (nbHotel,idSala),
foreign key (nbHotel) references Hoteles (nbHotel)) Engine = InnoDB;

