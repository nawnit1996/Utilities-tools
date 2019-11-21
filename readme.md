
How it Works?
=>You just have to enter env detail and a clue about hostname(for example enter ka for kafkaServer) ,it will give you all search result for that host. Select your choice and Bammm!!! You are logged in.
=>The best part is it changes your terminal title which helps you recognise which tab is for which host.It was quite confusing for me when I used to login into more then one hosts at time.

What you need to do?

Running step:-
Step1 :  Place following two file in your home directory. (Home directory because when you open terminal by default it opens in home directory.)
Step 2 :  Replace unix Id with your unix iD in hostDetail.properties file.
Step 3 :  Go to home directory or wherever you have put those two files and run command "chmod 777 login.sh”
Step 4 : Run login.sh script with command “./login.sh”

Adding your own property:-
>There are already few property added into hostDetail.properties. 
>To add your own property ,add key value Pair of deployable name and hosts url(You can add  in similar way other properties are there). Make sure all keys are unique.
>Also add those deployable name key in array specified for that environment. Host name store in array variable should be space separated.
	Example :
		If you have to add property for kafkaServer uat then,
			1. Add a key-value pair as.     kafkaServer_uat1=ec2.instatnce.sdflssf.com
			2. Add key kafkaServer_uat1 in arrayvariable  declared for uat env i.e, uatArray.  (Add it separated with space.)
	 Note: In case of more than one host for one deployable use 1 or 2 in key.
