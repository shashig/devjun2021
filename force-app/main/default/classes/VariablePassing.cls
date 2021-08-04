public with sharing class VariablePassing {
    public static void checkVariablePassing() {
        Integer i;
        List<String> stringList = new List<String>{'Venerate', 'Marlabs'};

        System.debug('>>> Before call: i = ' + i + ', stringList: ' + stringList);

        VariablePassing.changeVariables(i, stringList);

        System.debug('>>> After call: i = ' + i + ', stringList: ' + stringList);
    }

    private static void changeVariables(Integer num, List<String> stringList) {
        num = 40;
        stringList.add('HFS');
    }
}
