public with sharing class SimpleClass {
    String name;
    public SimpleClass(String name) {
        this.name = name;
    }

    //Funtion to add two numbers
    public static Integer sumOfTwoNumbers(Integer i, Integer j) { 
        return (i + j);
    }

    //Function to find the biggest between two numbers
    public static Integer biggestNumber(Integer i, Integer j) { 
        if (i < j) {
            return (j);
        } else {
            return (i);
        }
    }
}