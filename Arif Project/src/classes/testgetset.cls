public class testgetset {
public Integer gh {get; set;}
static Integer gh4 {get; set;}
public testgetset()
{
  gh = 10;
  gh4= 10;
}

public pagereference hj()
{
  gh=gh4+12;
  return null;
} 
 
}