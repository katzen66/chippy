#include <bits/stdc++.h>
using namespace std;
string s, p;
char c;
int main()
{
  while( cin >> s )
  {
    if( s== "MOV" || s=="MVI")
    { 
      if(s=="MOV") cout << "10";
      else cout <<"11";
      cin >> c;
      if( c!='M')c-='A';
      else c=7;
      bitset <3> I(c);
      for( int i = 2; i >-1; i--) cout << I[i];
      cin >> c;
      if( c!='M')c-='A';
      else c=7;

      bitset <3> D(c);
      for( int i = 2; i >-1; i--) cout << D[i];
    }
    else if( s=="ADD")
    {
      cout << "01";
      cin >> c;
      if( c!='M')c-='A';
      else c=7;
      bitset <3> I(c); 
      for( int i = 2; i >-1; i--) cout << I[i];
      cout << "000" ;
    }
    cout << "\n";
  }
}
