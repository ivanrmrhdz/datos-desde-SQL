//Carlos Ivan Romero Hernandez RH18030

//Librerias
#include <iostream>
#include <mysql.h>
#include <mysqld_error.h>

using namespace std;

//Declaracion de funciones
void menu();//menu principal
void mcliente();//mostrar clientes
void mproducto();//mostrar productos
void mcotizacion();//mostrar cotizaciones
void clear(); //limpia la pantalla 
void errord(); //evita que se ingrese datos incorrectos


int main(int argc, char** argv) {
	system("color 8F");//color de fondo y texto	
	
	menu();
	

	return 0;
}

//funcion menu
void menu()
{
		int a;
	
		do{
		
		clear();		
		cout << "************************************" << endl;		
		cout << "*            Bienvenido!           *" << endl;		
		cout << "************************************" << endl;
		cout<<endl;
		cout<<endl;		
	    cout << "Menu" << endl;	    
	    cout << "1.Mostrar clientes" << endl;	    
	    cout << "2.Mostrar productos" << endl;	    
	    cout << "3.Mostrar cotizaciones" << endl;	    
		cout << "4.Salir" << endl;	   
	    cout<<endl;	
	    cout << "Elija un opcion: ";
	    cin >> a;
	    errord();
    } while(a < 1 || a > 5);
	
	
	switch(a)
	{
		
		case 1:
			cout<<endl;
			mcliente();
			break;
		case 2:
			cout<<endl;
			mproducto();
			break;
		case 3:
			cout<<endl;
			mcotizacion();
			break;
		case 4:
			cout<<endl;
			cout << "Que pase un buen dia!" << endl;
			system("pause");
			break;
						
	}
	
	
}

//funcion mostrar cliente
void mcliente()
{
	clear();
	cout<<"Clientes"<<endl;
	cout<<endl;
	
	//conexion con MySQL y la base de datos
    MYSQL *conn;
    MYSQL  mysql;
    MYSQL_RES *res;
    MYSQL_ROW row;
    mysql_init(&mysql);
    conn=mysql_real_connect(&mysql,"localhost","root","","baseprogra",0,0,0);
    
    if(conn==NULL)
    {  
		cout<<mysql_error(&mysql)<<endl;
    	system("pause");        
    }
    
    //Comando de consulta, se muestran los resultados
    mysql_query(conn,"select * from clientes");
    res = mysql_store_result(conn);
    
    while((row=mysql_fetch_row(res)) != NULL)
    {
        cout << "Codigo del cliente: " << row[0] << endl;
        cout << "Nombre: " << row[1] << endl;
        cout << "Apellido: " << row[2] << endl;
        cout << "Telefono: " << row[3] << endl;
        
        cout << "\n\n";
    }  
	
	mysql_close(conn);   
	system("pause");
	menu();
}

//funcion mostrar productos
void mproducto()
{
	clear();
	cout<<"Productos"<<endl;
	cout<<endl;
	
	//conexion con MySQL y la base de datos
	MYSQL *conn;
    MYSQL  mysql;
    MYSQL_RES *res;
    MYSQL_ROW row;
    mysql_init(&mysql);
    conn = mysql_real_connect(&mysql,"localhost","root","","baseprogra",0,0,0);
    
    if(conn == NULL)
    {  
		cout << mysql_error(&mysql)<<endl;
		cout << "Ha ocurrido un error de conexion" << endl;
    	system("pause"); 
    }
    
    //Comando de consulta, se muestran los resultados
    mysql_query(conn,"select * from productos");
    res=mysql_store_result(conn);
    
    while((row=mysql_fetch_row(res)) != NULL)
    {
        cout << "Codigo del producto: " << row[0] << endl;
        cout << "Nombre del producto: " << row[1] << endl;
        cout << "Precio: $" << row[2] << endl;
        cout << "Existencias: " << row[3] << endl;
        cout << "Fecha de ingreso: " << row[4] << endl;
        
        cout << "\n\n";
    }
    
	mysql_close(conn); 
	system("pause");
	menu();	
}

//funcion mostrar cotizaciones
void mcotizacion()
{
	clear();
	cout<<"Cotizaciones"<<endl;
	cout<<endl;
	//conexion con MySQL y la base de datos
    MYSQL *conn;
    MYSQL  mysql;
    MYSQL_RES *res;
    MYSQL_ROW row;
    mysql_init(&mysql);
    conn = mysql_real_connect(&mysql,"localhost","root","","baseprogra",0,0,0);
    
    if(conn == NULL)
    {  
		cout << mysql_error(&mysql)<<endl;
		cout << "Ha ocurrido un error de conexion" << endl;
    	system("pause");       
    }
    
    //Comando de consulta, se muestran los resultados
    mysql_query(conn,"SELECT cotizaciones.codcotizacion, productos.nombreprod, clientes.nombrecl, cotizaciones.fechacot FROM ((cotizaciones INNER JOIN productos ON cotizaciones.codpro = productos.codpro) INNER JOIN clientes ON cotizaciones.codcliente = clientes.codcliente)");
    res=mysql_store_result(conn);
    
    while((row=mysql_fetch_row(res)) != NULL)
    {
        cout << "Codigo de cotizacion: " << row[0] << endl;
        cout << "Nombre del producto: " << row[1] << endl;
        cout << "Nombre del cliente: " << row[2] << endl;
        cout << "Fecha de cotizacion: " << row[3] << endl;
               
        cout << "\n\n";
    }
    	
	mysql_close(conn);
	system("pause");
	menu();	
}

void clear() //Funcion que permite limpiar la pantalla
{
	
	system("cls");
}

void errord() //funcion que evita que se ingrese datos incorrectos
{
		//Ciclo while paraevitar datos incorrectos
		while(cin.fail()){

		//Limpia el buffer de los datos ingresados
		cin.clear();

		//Ignora los primeros 1000 caracteres o en este caso los numeros
		cin.ignore(1000,'\n');

		}
}


