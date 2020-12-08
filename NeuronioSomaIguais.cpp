#include <iostream>
#include <stdio.h> 
#include <stdlib.h> 
#include <cstdlib>

using namespace std;

int main(void){
  srand(time(NULL));
	//limites para os pesos (0 a 1)
	int x = 0;
	int y = 100;
	
	//peso 1
	int x1 =(x + rand()% (y-x+1));
	double s1 = (double)x1/100;
  cout << "S1 = " << s1 << "\n";

	//double s1 = 0;

	//peso 2
	int x2 =(x + rand()% (y-x+1));
	double s2 = (double)x2/100;
  cout << "S2 = " << s2 ;

	//double s2 = 0.8;
	
	//solicitar informações
	int repeticao = 0;
	double taxa_a = 0;
	cout <<"\nInsira o numero de tentativas a serem feitas:";
	cin >> repeticao;
	cout <<"\nInsira a taxa de aprendizado:";
	cin >> taxa_a;
	
	//estrutura do neoronio
	double soma_pesos = 0;
	double soma_numeros = 0;
	for (int i = 1; i <= repeticao; i++){
		soma_pesos = (s1*i) + (s2*i);
		soma_numeros = i + i;
		s1 = s1+((soma_numeros-soma_pesos)*taxa_a*(double)i);
		s2 = s2+((soma_numeros-soma_pesos)*taxa_a*(double)i);
		/*para testar a alteração dos pesos*/ cout << s1 << "\t" << s2 << endl;
	}
	
	for (int i = 1; i <= 100; i++){
		soma_pesos = (s1*i) + (s2*i);
		cout << i <<" + " << i <<" = "<< soma_pesos << endl;
	}
}

