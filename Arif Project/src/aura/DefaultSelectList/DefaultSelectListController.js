({
	loadOptions: function(component, event, helper){
    var opts = [
        { value: "Cyan", label: "Cyan" }, 
        { value: "Yellow", label: "Yellow" },  
        { value: "Magenta", label: "Magenta" /*, selected: true */}];
    component.set('v.options', opts);
    //set the new selected value on the component
    component.set('v.selectedValue', 'Yellow'); 
    //return the selected value
    component.find("mySelect").get("v.value");
}
})