#%%
import easygui as eg
eg.msgbox("Hello There ！")          # msgbox:  message box
user_response = eg.msgbox("HEllO!")
#print(user_response)
flavor = eg.buttonbox("what is your favorate ice cream flavor?",choices = ['Vanilla','Chocolate','Strawberry'])            # buttonbox:   choices box

eg.msgbox("you picked\t" +flavor)


# %%
import  easygui as eg
flavor = eg.enterbox("What is your favorate ice cream flavor?")
eg.msgbox('You entered\t'+flavor)

# %%
