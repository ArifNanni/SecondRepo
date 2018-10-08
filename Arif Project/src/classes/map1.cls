public class map1 {
public Map<String,map<string,Account>> directors {
    get {
     Account acc =  [select id,name from Account limit 1];
        directors = new Map<String,map<string,Account>>();
        map<string,account> ma = new map<string,account>();
        ma.put('Arif',acc);
        ma.put('asde',acc);
        directors.put('nannu',ma);
        return directors;
        
    }
    set;

}

}