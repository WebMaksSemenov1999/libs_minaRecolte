def ParsringOrder(obj):
    stringOrder = ""
    for key in obj:
        if obj[key] == True:
            stringOrder += key +  ' DESC,'
        if obj[key] == False:
            stringOrder += key  +  ' ASC,'
    
    return stringOrder[0:-1]