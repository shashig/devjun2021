({
    doInit : function(component, event, helper) {
        console.log('Came into doInit');
        console.log('person: ' + component.get("v.person"));
        component.set("v.person", 'Have Fun Solving');
    },
    sayHello : function(cmp, event, helper) {
        console.log('Came into sayHello');
        const name = cmp.find("nameInputId").get("v.value"); //Get input text field value
        cmp.set("v.person", name); //Set the component attribute value
    } 
})
