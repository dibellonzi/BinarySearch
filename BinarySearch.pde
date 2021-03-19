public static class Item
{
    private int myCatNum, myInventory;
    public Item(int nNum, int nInv)
    {
        myCatNum = nNum;
        myInventory = nInv;
    }
    public int getCatNum(){return myCatNum;}
    public int getInventory(){return myInventory;}

                            
public static int linearSearch(Item[] store, int catNumToFind)
{
  for(int i=0; i<store.length; i++){
    if(store[i].getCatNum()==catNumToFind){
      return store[i].getInventory();
    }
  }
  return -1;
}
public static int recursiveLinearSearch(Item[] store, int catNumToFind, int startIndex)
{
   if(store[startIndex].getCatNum()==catNumToFind){
    return store[startIndex].getInventory();
  }
  if(startIndex==store.length-1 && store[store.length-1].getCatNum()!=catNumToFind){
    return -1;
  }
  return recursiveLinearSearch(store, catNumToFind,  startIndex+1);
}
public static int binarySearch(Item[] store, int catNumToFind)
{
  int guess=store.length/2;
  int low=0;
  int high=store.length-1;
  while(low<=high){
    if(store[guess].getCatNum()==catNumToFind){
      return store[guess].getInventory();
    }
    else if(store[guess].getCatNum()>catNumToFind){
      high=guess-1;
      guess=(low+high)/2;
    }
    else {
      low=guess+1;
      guess=(low+high)/2;
    }
  }    
  return -1;
}
public static int recursiveBinarySearch(Item[] store, int catNumToFind, int nLow, int nHigh)
{
    int guess = (nLow+nHigh)/2;
  if(store[guess].getCatNum()==catNumToFind){
    return store[guess].getInventory();
  }
  else if(nHigh==nLow){
   return -1;
 }
 else if(store[guess].getCatNum()>catNumToFind){
   nHigh = guess-1;
   return recursiveBinarySearch(store, catNumToFind,nLow,nHigh);
 }
 else if(store[guess].getCatNum()<catNumToFind){
   nLow = guess+1;
  return recursiveBinarySearch(store, catNumToFind,nLow,nHigh);
 }
 else{
   return -1;
 }  
  
}
}
 Item[] store = 
{
  new Item(184, 14), 
  new Item(196, 60), 
  new Item(206, 31), 
  new Item(2370, 65), 
  new Item(7282, 73), 
  new Item(8303, 90), 
  new Item(12328, 63), 
  new Item(12705, 14), 
  new Item(13066, 8), 
  new Item(14088, 92), 
  new Item(15320, 82), 
  new Item(15814, 60), 
  new Item(15917, 51), 
  new Item(17911, 96), 
  new Item(18061, 3), 
  new Item(18410, 56), 
  new Item(18465, 27), 
  new Item(18618, 64), 
  new Item(18871, 69), 
  new Item(19967, 45)
}; 
public void setup()
{
  int[] tests = {0, 183, 184, 2370, 15320, 19967, 19968};
  
  System.out.println();
  System.out.println("Testing Non-Recursive Linear Search");
  System.out.println("=====================");
  for (int i = 0; i < tests.length; i++)
  {

    if (Item.linearSearch(store,tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+Item.linearSearch(store,tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Recursive Linear Search");
  System.out.println("=====================");
  for (int i = 0; i < tests.length; i++)
  {

    if (Item.recursiveLinearSearch(store,tests[i],0) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+Item.recursiveLinearSearch(store,tests[i],0) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Non-Recursive Binary Search");
  System.out.println("===================================");
  for (int i = 0; i < tests.length; i++)
  {

    if (Item.binarySearch(store,tests[i]) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+Item.binarySearch(store,tests[i]) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
  System.out.println();
  System.out.println("Testing Recursive Binary Search");
  System.out.println("===============================");
  for (int i = 0; i < tests.length; i++)
  {

    if (Item.recursiveBinarySearch(store,tests[i], 0, store.length - 1) != -1)
      System.out.println("Catalog #"+tests[i]+" has "+Item.recursiveBinarySearch(store,tests[i], 0, store.length - 1) + " in stock");
    else
      System.out.println("Catalog #"+tests[i]+" not found");
  }
}






