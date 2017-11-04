#!/bin/bash

while :
do
echo "Main Menu:"
echo -e "\t(1) Encrypting/ Decrypting A File"				#Done needs debugging
echo -e "\t(2) SSH Menu"						#Working on it With debugging
echo -e "\t(3) Reconnaissance (Nmap)"					#DONE
echo -e "\t(4) Parsing Fields Of A Dump"				#N/A
echo -e "\t(5) System Information"					#HALF WAY done
echo -e "\t(6) Forensic Scripts"					#partial 
echo -e "\t(7) Exploitation Menu"					#not there
echo -e "\t(8) Post-Exploitation Menu"					#not there
echo -e "\t(9) Firewall (IP tables)"
echo -e "\t(0) Exit Menu"
echo -n "Please enter your selection: "
read choice
case $choice in
    "1"|"1")
    while :
    do
    echo "Encryption / Decryption:"
    echo -e "\t(a) Encrypt A File"
	echo -e "\t(b) Decrypt A File"
    echo -e "\t(c) Return to Main Menu"
    echo -n "Enter your selection: "
    read choice1
    case $choice1 in
        "a"|"A")
			echo "Insert the path to the soon to be encrypted file."
			read encryption
			echo ""
			echo "Save the file as what?"
			read outputfile
			echo ""
			sudo -s openssl aes-256-cbc -a -salt -in $encryption -out $outputfile
			echo "--------------------------"
			echo "Deleting original file now. Standby...."
			rm $encryption
			echo "--------------------------"
			echo "Your file has been sucessfully encrypted. Old file has been removed"
			echo "====================================================================";;

        "b"|"B")
			echo "What file do you want to decrypt?"
			read $decryption
				echo ""
				echo "Save the decypted file as?"
				read newfile
				sudo -s openssl aes-256-cbc -d -a -in $decryption -out $newfile
				echo "--------------------------------------------------------"
			echo "Your file has been decrypted. Your file is below"
				echo ""
				echo ""
				cat $newfile
				echo "========================================================";;
	#	"c"|"C")
	#	break
	#	;;
    #        *)
	#		echo ""
     #       echo "Your selection is invalid, please try again."
	#	echo ""
     #       ;;
    esac
    done
	;;

	"2"|"2")
    while :
    do
    echo "SSH Menu:"
    echo -e "\t(a) SSH transfer from local to remote host"
	echo -e "\t(b) SSH transfer from remote to local host"
	echo -e "\t(c) Turn SSH service ON"
	echo -e "\t(d) Turn SSH service OFF"
	echo -e "\t(e) RESTART SSH service"
    echo -e "\t(f) Return to Main Menu"
    echo -n "Enter your selection: "
    read choice2
    case $choice2 in
        "a"|"A")
		echo "What is the username and ip address of the server? (ex. bobothefool@ipadress)"
		read $sshaddress
		sudo ssh $sshaddress
        ;;
        "b"|"B")
		echo "Still didnt finish this"
        ;;
		"c"|"C")
			echo "Starting ssh services"
			sudo service ssh start
			sudo service ssh status
			q
		;;
		"d"|"D")
			echo "Ending SSH services"
			sudo service ssh stop
			sudo service ssh status
			q
		;;
		"e"|"E")
			sudo service ssh restart
		;;
		"f"|"F")
		break
		;;
            *)
            echo "Your selection is invalid, please try again."
            ;;
    esac
    done
    ;;

	"3"|"3")
    while :
    do
    echo "Reconnaissance Menu:"
    echo -e "\t(a) Ping Sweep"
	echo -e "\t(b) Stealth Scan (IDS Evasion)"
	echo -e "\t(c) Xmas Scan"
	echo -e "\t(d) Zombie Scan"
	echo -e "\t(e) Full Scan (Loud)"
    echo -e "\t(f) Return to Main Menu"
    echo -n "Enter your selection: "
    read choice3
    case $choice3 in
        "a"|"A")
		echo "I need a IP address or range."
		echo "The IP address or range is what"
		echo ""
		read $scanrange
		echo "Ping sweeping $scanrange"
		sudo nmap -sn $scanrange
        ;;
        "d"|"D")
		echo "Conductiong IDS evasion, stand by."
		echo "I need a IP address"
		read scanrange
		echo "Output scan to what file"
		read outputfile
		echo "==================================="
		echo "Scanning $scanrange"
		sudo nmap -sS -v -T3 $scanrange > $outputfile
        ;;
	"e"|"E")
		echo "Loud scan. Lets kick down the door!"
		echo "Give me the IP address or range"
		read scanrange
		echo "Output to what file?"
		read outputfile
		echo "======================================"
		echo "Kicking down the $scanrange domain"
		sudo nmap -A -p- -T4 -v $scanrange > $outputfile
		;;
		"f"|"F")
		break
		;;
            *)
            echo "Your selection is invalid, please try again."
            ;;
    esac
    done
    ;;

	"4"|"4")
    while :
    do
    echo "Parsing Menu:"
    echo -e "\t(a) Parsing Test1"
	echo -e "\t(b) Parsing Test2"
	echo -e "\t(c) Parsing Test3"
    echo -e "\t(d) Return to Main Menu"
    echo -n "Enter your selection: "
    read choice4
    case $choice4 in
        "a"|"A")
        ;;
        "b"|"B")
        ;;
		"c"|"C")
		;;
		"d"|"D")
		break
		;;
 			*)
            echo "Your selection is invalid, please try again."
            ;;
	esac
	done
	;;

	"5"|"5")
    while :
    do
    echo "System Information Menu:"
    echo -e "\t(a) Host name"
	echo -e "\t(b) Current User"
	echo -e "\t(c) Current Time"
	echo -e "\t(d) Kernerl Version Query"
	echo -e "\t(e) List active users"
    echo -e "\t(f) Return to Main Menu"
    echo -n "Enter your selection: "
    read choice5
    case $choice5 in
        "a"|"A")
		echo ""
		echo "Getting the hostname"
		echo ""
		hostname
		echo ""
        ;;
        "b"|"B")
		echo "Getting Current User"
		echo ""
		whoami
		pwd
		echo ""
        ;;
	"c"|"C")
		echo "Grabbing Current System Time"
		echo ""
		date
		echo ""
		;;
	"d"|"D")
		echo "Kernal Version"
		echo ""
		sudo uname -a
		echo ""
		echo ""
		;;
	"e"|"E")
		echo "Grabbing all active users"
		echo ""
		sudo cat /etc/passwd | grep /bin/bash
		;;
	"f"|"F")
		;;
	"g"|"G")
		;;
	"h"|"H")
		break
		;;

            *)
            echo "Your selection is invalid, please try again."
            ;;
    esac
    done
    ;;

	"6"|"6")
    while :
    do
    echo "Forensic Script Menu:"
    echo -e "\t(a) Partition View"
	echo -e "\t(b) Create Forensic Image"
	echo -e "\t(c) Open"
	echo -e "\t(d) Open"
	echo -e "\t(e) Open"
    echo -e "\t(f) Return to Main Menu"
    echo -n "Enter your selection: "
    read choice6
    case $choice6 in
        "a"|"A")
		echo "Enter path to Device"
		read devicepath
		sudo sudo fdisk -l $devicepath
        ;;
        "b"|"B")
		echo "Creating a forensic image"
		echo ""
		echo "Please enter the device path"
		read devicepath1
		echo "The device you are copying is $devicepath1 , correct?"
		echo ""
		echo "Pleae enter the path of where you would like to save the image. (Remember the file ending (.iso or .dd)"
		read devicepath2
		echo "You would like to save the image at $devicepath2 , correct?"
		echo ""
		echo "Well, here we go"
		sudo dc3dd if=$devicepath1 hash=md5 of=$devicepath2
        ;;
		"c"|"C")
		;;
		"d"|"D")
		;;
		"e"|"E")
		;;
		"f"|"F")
		break
		;;
            *)
            echo "Your selection is invalid, please try again."
            ;;
    esac
    done
    ;;

    "7"|"7")
    while :
    do
    echo "Exploitation Menu:"
    echo -e "\t(a) Encrypted Payload"
	echo -e "\t(b) Test1"
	echo -e "\t(c) Test2"
	echo -e "\t(d) Test3"
	echo -e "\t(e) Test4"
    echo -e "\t(f) Return to Main Menu"
    echo -n "Enter your selection: "
    read choice7
    case $choice7 in
        "a"|"A")
        ;;
        "b"|"B")
        ;;
		"c"|"C")
		;;
		"d"|"D")
		;;
		"e"|"E")
		;;
		"f"|"F")
		break
		;;
            *)
            echo "Your selection is invalid, please try again."
            ;;
    esac
    done
    ;;

	"8"|"8")
    while :
    do
    echo "Post-Exploitation Menu:"
    echo -e "\t(a) Reverse TCP Backdoor"
	echo -e "\t(b) Backdoor Handler"
	echo -e "\t(c) Test2"
	echo -e "\t(d) Test3"
	echo -e "\t(e) Test4"
    echo -e "\t(f) Return to Main Menu"
    echo -n "Enter your selection: "
    read choice8
    case $choice8 in
        "a"|"A")
		echo "Creating a TCP Backdoor"
		echo ""

        ;;
        "b"|"B")
        ;;
		"c"|"C")
		;;
		"d"|"D")
		;;
		"e"|"E")
		;;
		"f"|"F")
		break
		;;
            *)
            echo "Your selection is invalid, please try again."
            ;;
    esac
    done
    ;;

	"9"|"9")
    while :
    do
    echo "Quick firewall config (linux):"
    echo -e "\t(a) ALL in one firewall config"
	echo -e "\t(b) Dropping all null packets"
	echo -e "\t(c) Blocking Syn Flood"
	echo -e "\t(d) Block XMAS scans"
	echo -e "\t(e) Test5"
    echo -e "\t(f) Return to Main Menu"
    echo -n "Enter your selection: "
    read choice8
    case $choice8 in
        "a"|"A")
		echo "Flushing all current rules from iptables"
		sudo iptables -F
		echo ""
		echo "Opening SSH........now"
		sudo iptables -A INPUUT -p tcp --dport 22 -j ACCEPT
		echo ""
		echo "Setting the default polices for INPUT FOWARD and OUTPUT"
		echo ""
		sudo iptables -P INPUT DROP
		sudo iptables -P FORWARD DROP
		sudo iptables -P OUTPUT ACCEPT
		echo "Opening access for local host"
		#THIS NEEDS FIXsudo iptables -A -i lo -j ACCEPT 
		echo "Allowing established and related connections to continue"
		sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
		echo ""
		echo "Save the settings for the firewall as what?"
		read firewallname
		echo ""
		echo "Saving as $firewallname"
		sudo iptables-save -t $firewallname
		echo ""
		sudo iptables -L -v
        ;;
        "b"|"B")
		echo "Dropping all null packets currently"
		echo ""
		echo ""
		sudo iptables -A input -p tcp --tcp-flags ALL NONE -j DROP
		sudo iptables -L -v
        ;;
	"c"|"C")
		echo "Block syn flooding (DDos)"
		echo ""
		sudo iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
		sudo iptables -L -v
		;;
	"d"|"D")
		echo "Block XMAS scans on the machine"
		echo ""
		sudo iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
		sudo iptables -L -v
		;;
	"e"|"E")
		echo "Blocking SSH Brute Force"
		echo ""
		echo "Please specifiy an interface to configure"
		read interface
		sudo iptables -I INPUT -p tcp --dport 22 -i $interface -m state --state NEW -m recent --set
		sudo iptables -I INPUT -p tcp --dport 22 -i $interface -m state --state NEW -m recent --update --seconds 60 --hitcount 4 -j DROP
		sudo iptable -L -v 
		;;
	"f"|"F")
		break
		;;
            *)
          	echo "Your selection is invalid, please try again."
            ;;
    esac
    done
    ;;

	"0"|"0")
	exit
	;;
        *)
        echo "Your selection is invalid, please try again."
		echo ""
        ;;

esac
done