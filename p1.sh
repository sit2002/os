
*************number is palidrome or not***********************
echo enter n
read n
num=0
on=$n
while [ $n -gt 0 ]
do
num=$(expr $num \* 10)
k=$(expr $n % 10)
num=$(expr $num + $k)
n=$(expr $n / 10)
done
if [ $num -eq $on ]
then
echo palindrome
else
echo not palindrome
fi
*********prime number***********
#!/bin/bash
echo -e "Enter Number : \c"
read n
for((i=2; i<=$n/2; i++))
do
  ans=$(( n%i ))
  if [ $ans -eq 0 ]
  then
    echo "$n is not a prime number."
    exit 0
  fi
done
echo "$n is a prime number."

*************reverse number**************
echo enter n
read n
num=0
while [ $n -gt 0 ]
do
num=$(expr $num \* 10)
k=$(expr $n % 10)
num=$(expr $num + $k)
n=$(expr $n / 10)
done
echo number is $num

*******palidrome string***********
#!/bin/bash
echo "Enter a String"
read input
reverse=""

len=${#input}
for (( i=$len-1; i>=0; i-- ))
do 
	reverse="$reverse${input:$i:1}"
done
if [ $input == $reverse ]
then
    echo "$input is palindrome"
else
    echo "$input is not palindrome"
fi

****************************************
Assignment No.1 

Write a program to implement an address book with the options given below: a) Create address book. b) View address book. c) Insert a record. d) Delete a record. e) Modify a record. f) Exit


#!bin/bash

create()
{
echo "----------------------------------"
echo "Enter filename to create: "
read filename
if [ -f $filename ]
then
	echo "File already Exist"
else
	touch $filename
	echo "[*] File has been created!"
fi
echo "----------------------------------"
}

insert()
{
echo "----------------------------------"
echo "Enter the number of records to insert."
read n
for (( i=0;i<=$n-1;i++ ))
do
	echo "Enter Info Like"
	echo "Rollno		Name		EMailID		City"
	read a
	echo $a >> $filename
	
done
echo "[*] Data Inserted!"
echo "----------------------------------"
}

display()
{
echo "----------------------------------"
echo "[*] Address Book data is as follows"
echo "Rollno		Name		EMailID		City"
cat $filename
echo "----------------------------------"
}


search()
{
echo "----------------------------------"
echo "Enter keyword to search!"
read keyword
out=$(cat $filename | grep -w "$keyword")
if [ -z "$out" ]
then
	echo "Records Not Found!"
else
	echo "Records Found"
	echo $out
fi
}

delete()
{
echo "----------------------------------"
echo "Enter record to delete"
read recordtodelete
cat $filename | grep -v "$recordtodelete" > file2 ;mv file2 $filename
echo "Record has been deleted!"
echo "----------------------------------"
}

modify()
{
echo "----------------------------------"
echo "Enter roll no to modify"
read s
echo "Enter new record"
echo "Rollno		Name		EMailID		City"
read r
sed -i "/$s/c $r" $filename
echo "Record is modified!"
echo "----------------------------------"
}

until [[ "$ch" = "7" ]];
do
	echo "----------------------------------"
	echo "[1] Create Address Book!"
	echo "[2] Insert data into Address Book!"
	echo "[3] Display Address Book"
	echo "[4] Search record in Address Book"
	echo "[5] Delete a record"
	echo "[6] Modify a record"
	echo "[7] Exit"
	echo "----------------------------------"
	echo "[*] Enter your choice"
	read ch
	case $ch in
		1)create;;
		2)insert;;
		3)display;;
		4)search;;
		5)delete;;
		6)modify;;
		7);;
	esac
done

///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
Program[ a2Azombie.c ]: 
#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
void bubblesort(int a[],int n);
void selectionsort(int a[],int n);
int main()
{
	int a[10],n,i;
	pid_t id;
	printf("Enter the number of elements : ");
	scanf("%d",&n);
	printf("\nEnter the elements : ");
		for(i=0;i<n;i++)
		{
			scanf("%d",&a[i]);
		}
	id = fork();
	switch(id)
	{
		case -1 : printf("\nError in Fork");
				break;	
		case 0 : printf("\nChild process ID : %d",getpid());
			 printf("\nMy Parent Process ID : %d",getppid());
			 bubblesort(a,n);			 				
			 printf("\nI am Zombie...");
			 
				break;
		default : printf("\nParent process ID : %d",getpid());
			  selectionsort(a,n);			  
			  printf("\n");		 			 
			  sleep(3);
			  while(1)
			  {

			  }			 			 
	}
	return 0;
}
void bubblesort(int a[],int n)
{
int i,j,temp;
	for(i=0;i<n;i++)
	 {
		for(j=0;j<n-1;j++)
		 {
		   if(a[j]>a[j+1])
		    {
			temp=a[j];
			a[j]=a[j+1];
			a[j+1]=temp;
		    }
		 }
	 }
printf("\nAscending order : ");
	for(i=0;i<n;i++)
	 {
		printf("%d ",a[i]);
	 }
}
void selectionsort(int a[],int n)
{
int i,j,min,temp;
	for(i=0;i<n;i++)
	 {
	   min=i;	   
		for(j=i+1;j<n;j++)
		 {
		   if(a[j]>a[min])
		   {		    
		    min=j;
		   }
		 }
	   temp=a[i];
	   a[i]=a[min];
	   a[min]=temp;	   
	 }
printf("\nDescending order : ");
	for(i=0;i<n;i++)
	 {
		printf("%d ",a[i]);
	 }
}


[gkudale@localhost ~]$ gcc assg2azombie.c
[gkudale@localhost ~]$ ./a.out
Enter the number of elements : 5

Enter the elements : 7 1 9 5 3

Parent process ID : 2852
Descending order : 9 7 5 3 1 

Child process ID : 2853
My Parent Process ID : 2852
Ascending order : 1 3 5 7 9 
I am Zombie...


^Z
[1]+  Stopped                 ./a.out
[gkudale@localhost ~]$ ps -l
F S   UID   PID  PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
0 S  1000  2807  2803  0  80   0 - 29137 wait   pts/0    00:00:00 bash
0 T  1000  2852  2807 44  80   0 -  1038 signal pts/0    00:00:31 a.out
1 Z  1000  2853  2852  0  80   0 -     0 exit   pts/0    00:00:00 a.ou <defunct>
0 R  1000  2859  2807  0  80   0 - 30315 -      pts/0    00:00:00 ps


///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////

ORPHANS.c



#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
void bubblesort(int a[],int n);
void selectionsort(int a[],int n);
int main()
{
	int a[10],n,i;
	pid_t id;
	printf("Enter the number of elements : ");
	scanf("%d",&n);
	printf("\nEnter the elements : ");
		for(i=0;i<n;i++)
		{
			scanf("%d",&a[i]);
		}
	id = fork();
	switch(id)
	{
		case -1 : printf("\nError in Fork");
				break;	
		case 0 : printf("\nChild process ID : %d",getpid());
			 printf("\nMy Parent Process ID : %d",getppid());
			 bubblesort(a,n);
			 printf("\n");
			 sleep(5);			 				
			 printf("\nI am Orphan.");
			 printf("\nMy parent ID is : %d",getppid());			 
				break;
		default : printf("\nParent process ID : %d",getpid());
			  selectionsort(a,n);			  
			  printf("\n");		 			 
			  sleep(2);
				break;			  			 			 
	}
	return 0;
}
void bubblesort(int a[],int n)
{
int i,j,temp;
	for(i=0;i<n;i++)
	 {
		for(j=0;j<n-1;j++)
		 {
		   if(a[j]>a[j+1])
		    {
			temp=a[j];
			a[j]=a[j+1];
			a[j+1]=temp;
		    }
		 }
	 }
printf("\nAscending order : ");
	for(i=0;i<n;i++)
	 {
		printf("%d ",a[i]);
	 }
}
void selectionsort(int a[],int n)
{
int i,j,min,temp;
	for(i=0;i<n;i++)
	 {
	   min=i;	   
		for(j=i+1;j<n;j++)
		 {
		   if(a[j]>a[min])
		   {		    
		    min=j;
		   }
		 }
	   temp=a[i];
	   a[i]=a[min];
	   a[min]=temp;	   
	 }
printf("\nDescending order : ");
	for(i=0;i<n;i++)
	 {
		printf("%d ",a[i]);
	 }
}


[gkudale@localhost ~]$ gcc assg2borphan.c
gcc: error: assg2borphan.c: No such file or directory
gcc: fatal error: no input files
compilation terminated.
[gkudale@localhost ~]$ gcc assg2orphan.c
[gkudale@localhost ~]$ ./a.out
Enter the number of elements : 6

Enter the elements : 6 3 8 5 1 9

Parent process ID : 2930
Descending order : 9 8 6 5 3 1 

Child process ID : 2932
My Parent Process ID : 2930
Ascending order : 1 3 5 6 8 9 
[gkudale@localhost ~]$ 
I am Orphan.
My parent ID is : 1



///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////

SJF------------------
SJF
SJF

#include<stdio.h>

int main() {
	int AT[10], BT[10], temp[10];
	int i, small, cnt = 0, t, limit;
	double wait_time = 0, turnaround_time = 0, end;
	float avg_wt, avg_tat;
	printf("\nEnter the total number of Processor: ");
	scanf("%d", &limit);
	printf("\nEnter Details of %d Processes\n", limit);
	
	//Taking input
	for(i = 0; i < limit; i++) {
		printf("\nEnter Arrival Time of P%d : ", i+1);
		scanf("%d", &AT[i]);
		printf("Enter Burst Time of P%d : ", i+1);
		scanf("%d", &BT[i]);
		temp[i] = BT[i];
	}
	
	// Printing Table
	int j;
	printf("\nProcess   Arrival Time   Burst Time\n");
	for(j = 0; j < limit; j++) {
		printf("   P%d         %d              %d    \n", j+1, AT[j], BT[j]);
	}
	
	// shortest Job First Algorithm
	BT[9] = 9999;
	for(t = 0; cnt != limit; t++) {
		small = 9;
		for(i = 0; i < limit; i++) {
			if(AT[i] <= t && BT[i] < BT[small] && BT[i] > 0) {
				small = i;
		 	}
		}
		BT[small]--;
		if(BT[small] == 0) {
			cnt++;
			end = t + 1;
			wait_time = wait_time + end - AT[small] - temp[small];
			turnaround_time = turnaround_time + end - AT[small];
		}
	}
	
	// Printing Average TAT and WT 
	avg_wt = wait_time / limit;
	avg_tat = turnaround_time / limit;
	printf("\nAverage Waiting Time: %lf", avg_wt);
	printf("\nAverage Turnaround Time: %lf \n", avg_tat);
	return 0;
}



///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////


Round Robin:
Round Robin:
Round Robin:
Round Robin:
----------------------------
#include<stdio.h>
int main()
{
	int i,j,n,bu[10],wa[10],tat[10],t,ct[10],max;
	float awt=0,att=0,temp=0;
	//clrscr();
	printf("Enter the no of processes -- ");
	scanf("%d",&n);
		for(i=0;i<n;i++)
		{
		printf("\nEnter Burst Time for process %d -- ", i+1);
		scanf("%d",&bu[i]);
		ct[i]=bu[i];
	}
	printf("\nEnter the size of time slice -- ");
	scanf("%d",&t);
	
	max=bu[0];
	for(i=1;i<n;i++)
	if(max<bu[i])
	max=bu[i];
	for(j=0;j<(max/t)+1;j++)
		for(i=0;i<n;i++)
		if(bu[i]!=0)
			if(bu[i]<=t) {
			tat[i]=temp+bu[i];
			temp=temp+bu[i];
			bu[i]=0;
			}
			else {
			bu[i]=bu[i]-t;
			temp=temp+t;
			}
	for(i=0;i<n;i++)
	{
	wa[i]=tat[i]-ct[i]; 
	att+=tat[i];
	awt+=wa[i];
	}
	printf("\nThe Average Turnaround time is -- %f",att/n);
	printf("\nThe Average Waiting time is -- %f ",awt/n);
	printf("\n\tPROCESS\t BURST TIME \t WAITING TIME\tTURNAROUND TIME\n");
	for(i=0;i<n;i++)
	printf("\t%d \t %d \t\t %d \t\t %d \n",i+1,ct[i],wa[i],tat[i]);
	//getch();
	return 0;
}



----------------------
INPUT:
Enter the no of processes – 3
Enter Burst Time for process 1 – 24 
Enter Burst Time for process 2 -- 3 
Enter Burst Time for process 3 – 3 
Enter the size of time slice – 3 
OUTPUT:
PROCESS BURST TIME WAITING TIME TURNAROUNDTIME 
1 24 6 30
2 3 4 7
3 3 7 10
The Average Turnaround time is – 15.666667 The 
Average Waiting time is------------ 5.666667


///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////


PRODUCER ---      CONSUMER
------------------------------------------------
#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<semaphore.h>
#include<sys/types.h>
#include<unistd.h>

void *consumer();
void *producer();

pthread_t p, c; 
sem_t empty, full; 
pthread_mutex_t mutex; 
pthread_attr_t attr; 
int counter = 0;
int buffer[5]; 

//initialize all variables
void init() {

	pthread_attr_init(&attr); 
	sem_init(&full, 0, 0); 
	sem_init(&empty, 0, 5); 
	pthread_mutex_init(&mutex, NULL);
}

int main() {
	int np,nc,i;
	init();
   	printf("Enter no of producers : ");
	scanf("%d", &np);
	printf("Enter no of consumers : ");
	scanf("%d", &nc);

	
	for(i=0; i<np; i++) {	
		pthread_create(&p, &attr, producer, NULL);
	}
	for(i=0; i<nc; i++) {
		pthread_create(&c, &attr, consumer, NULL);
	}
	for(i=0; i<np; i++) pthread_join(p, NULL);
	for(i=0; i<nc; i++) pthread_join(c, NULL);	
	return 0;
}

void *producer() {
	int item = rand()%100;
	if(counter>=5) printf("buffer full..Error\n");
    sem_wait(&empty);
	pthread_mutex_lock(&mutex);
	
	if(counter<5) {
    	buffer[counter] = item;
		counter++;
		printf("Producer produced %d\n", item);
	}
	pthread_mutex_unlock(&mutex);
	sem_post(&full);

	sleep(1);
	pthread_exit(0);
}

void *consumer() {
	int item;
	if(counter==0) {
		printf("buffer empty..Error\n");	
		return 0;
	}
	sem_wait(&full);
	pthread_mutex_lock(&mutex);
	
	if(counter>0) {
		item = buffer[counter-1];
		counter--;
		printf("Consumer consumed %d\n", item);
	}
		
	pthread_mutex_unlock(&mutex);
	sem_post(&empty);

	sleep(1);
	pthread_exit(0);
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////


READER WRITER 

READER WRITER 

READER WRITER 
----------------------------------------------
#include<pthread.h>
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

pthread_mutex_t x, wsem;

pthread_t r, w;
int readcount;
int writecount;

void intialize() {
    pthread_mutex_init(&x, NULL);
    pthread_mutex_init(&wsem, NULL);
    readcount = 0;
	writecount = 0;
}

void* reader(void* param) {
    int waittime;
    waittime = rand() % 5;
    printf("\nReader is trying to enter");
    pthread_mutex_lock(&x);
    readcount++;
    if(readcount == 1)
        pthread_mutex_lock(&wsem);
    printf("\n\t%d Reader is inside.. ", readcount);
    pthread_mutex_unlock(&x);
    sleep(waittime);
    pthread_mutex_lock(&x);
    readcount--;
    if(readcount == 0)
        pthread_mutex_unlock(&wsem);
    pthread_mutex_unlock(&x);
    printf("\n\t\t%d Reader is Leaving..", readcount+1);
}   

void* writer(void* param) {
    int waittime;
    waittime = rand() % 3;
    printf("\nWriter is trying to enter..");
    writecount++;
    pthread_mutex_lock(&wsem);
    printf("\n%d Writer has entered", writecount);
	sleep(waittime);
	pthread_mutex_unlock(&wsem); 
	writecount--;
	printf("\n\t%d Writer is leaving..", writecount+1);
    sleep(5);
    exit(0);
}

int main() {
    int n1,n2,i;  
	printf("\n Reader/Writer Problem");  
    printf("\nEnter the no of readers: ");
    scanf("%d", &n1);
    printf("\nEnter the no of writers: ");
    scanf("%d", &n2);
    for(i=0; i<n1; i++)
        pthread_create(&r, NULL, reader, NULL);  
    for(i=0; i<n2; i++)
        pthread_create(&w, NULL, writer, NULL);
 
	for(i=0; i<n1; i++)
		pthread_join(r, NULL);
	for(i=0; i<n2; i++)
		pthread_join(w, NULL);

    exit(0);
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////

EXECVE

binnary.c
------
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<unistd.h>

void binarysearch(long int a[],int n);
int main(int argc,char *argv[],char *envp[])
{
int i,n=0;
long a[10];
for(i=0;argv[i]!=NULL;i++){
	a[i] = strtol(argv[i], NULL, 10);
	n++;
	}
printf("\n In Second Child process %d", getpid());
printf("\n My parent process %d", getppid());
binarysearch(a,n);
}



void binarysearch(long int a[],int n)
{
	int mid,i=0,j=n-1,temp,c=-1;
	printf("\nENter no to search: ");
	scanf("%d",&temp);
	printf("\nIn Binary Program\n");
	while(i<=j){
		mid=(i+j)/2;
		if(a[mid]==temp){
			c=1;
			break;
		}
		else if(temp>a[mid]){
			i=mid+1;
		}
		else{
			j=mid-1;
		}
	}
	if(c==-1){
		printf("The searchterm not found %d ",temp);
	}
	else{
	printf("The searchterm found %d ",temp);
	}
	
}
------

MANI.C
------
#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<unistd.h>

void bubblesort(int a[],int n);

pid_t pid;
void main(){

int i,n,a[10];
char *argv[12];
for(i=0;i<12;i++){
	argv[i] = (char *) malloc(20);
	}
	
printf("\n ENter no of elements: ");
scanf("%d",&n);
printf("\nENter the elements: ");
for(i=0;i<n;i++){
	scanf("%d",&a[i]);
}
bubblesort(a,n);
pid = fork();

switch(pid){
	case -1:
		printf("\nSOmeting went wrong");
		break;
	case 0:
		printf("\nIn child process: %d",getpid());
		printf("\nMy Parent process: %d",getppid());
		for(i=0;i<n;i++){
			sprintf(argv[i+1],"%d",a[i]);
		}
		argv[0]= "binary";
		argv[n+2] =NULL ;
		execv("binarysearch",argv);
		printf("\n Called execv ");
		break;
	default:
		printf("\n In Parent process: %d",getpid());
		printf("\nSorted Elements: ");
		for(i=0;i<n;i++){
			printf(" %d ",a[i]);
		}
		printf("\n");
		sleep(5);
		printf("\n----------------------\n In Parent process: %d\n----------------------\n",getpid());

}

}

void bubblesort(int a[], int n){
	int i,j,temp;
	for(i=0;i<n;i++){
		for(j=0;j<n-1;j++){
			if(a[j]>a[j+1]){
				temp=a[j];
				a[j]=a[j+1];
				a[j+1]=temp;
			}
		}
	}
	printf("\n");
}
-------


///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////

FIFO-FIFO
FIFO-FIFO
FIFO-FIFO

fifo1.c
-------------------------------------------------------
#include<stdio.h>

#include<fcntl.h>

#include<string.h>

#include<unistd.h>

#include<sys/types.h>

#include<sys/stat.h>



int main()

{

	int fd1,fd2;

	char *myfifo1 = "file1",str1[100],str2[100];

	char *myfifo2 = "file2";



	fd1=mkfifo(myfifo1,0666);

	fd2=mkfifo(myfifo2,0666);



	printf("\nEnter data: ");

	fgets(str1,100,stdin);



	fd1=open(myfifo1,O_WRONLY);

	write(fd1,str1,strlen(str1)+1);

	close(fd1);



	fd2=open(myfifo2,O_RDONLY);

	read(fd2,str2,100);



	printf("\nMessage from fifo2 process:\n%s",str2);

	close(fd2);



}
-----------------

FIFO2.c
------------------
#include<stdio.h>

#include<fcntl.h>

#include<string.h>

#include<unistd.h>

#include<sys/types.h>

#include<sys/stat.h>



int main()

{

	FILE *fp;

	int fd1,fd2,l=1,w=1,c=0,i;

	char *myfifo1 = "file1",str1[100],ch;

	char *myfifo2 = "file2",str2[100];



	fd1=open(myfifo1,O_RDONLY);

	read(fd1,str1,100);

	printf("\n Pipe1: %s",str1);



	i=0;

	while(str1[i]!='\0')

	{

		if(str1[i]=='.'||str1[i]=='\n')

			l++;

		else if(str1[i]==' ')

			w++;

		else

			c++;

		i++;

	}



	printf("\nNo of lines: %d",l);

	printf("\nNo of words: %d",w);

	printf("\nNo of characters: %d\n",c);



	fp=fopen("kp.txt","w");

	fprintf(fp, "\n No of lines: %d",l);

	fprintf(fp, "\n No of words: %d",w);

	fprintf(fp, "\n No of characters: %d",c);

	fclose(fp);

	fp=fopen("kp.txt","r");

	ch=fgetc(fp);

	i=0;

	while(ch!=EOF)

	{

		str2[i]=ch;

		i++;

		ch=fgetc(fp);

	}

	str2[i]='\0';

	fclose(fp);



	close(fd1);



	fd2=open(myfifo2,O_WRONLY);

	write(fd2,str2,strlen(str2)+1);

	close(fd2);

}
---------------


///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////


BANKERS ALGO
----------------

#include <stdio.h>
#include <stdlib.h>
void final_output(int k[][10], int n, int p)
{
int i, j;
for (i = 0; i < n; i++)
{
printf("\n");
for (j = 0; j < p; j++)
{
printf("%d\t", k[i][j]);
}
}
}
//Banker's Algvorithm
void Banker(int A[][10], int N[][10],
int M[10][10], int W[1][10], int *n, int *m)
{
int i, j;
printf("\n Enter total number of processes : ");
scanf("%d", n);
printf("\n Enter total number of resources : ");
scanf("%d", m);
for (i = 0; i < *n; i++)
{
printf("\n Process %d\n", i + 1);
for (j = 0; j < *m; j++)
{
printf(" Allocation for resource %d : ", j + 1);
scanf("%d", &A[i][j]);
printf(" Maximum for resource %d : ", j + 1);
scanf("%d", &M[i][j]);
}
}
printf("\n Available resources : \n");
for (i = 0; i < *m; i++)
{
printf(" Resource %d : ", i + 1);
scanf("%d", &W[0][i]);
}
for (i = 0; i < *n; i++)
for (j = 0; j < *m; j++)
N[i][j] = M[i][j] - A[i][j];
printf("\n ***Allocation Matrix***");
final_output(A, *n, *m);
printf("\n ***Maximum Requirement Matrix""****");
final_output(M, *n, *m);
printf("\n ****Need Matrix****");
final_output(N, *n, *m);
}
//Safety algorithm
int safety(int A[][10], int N[][10],
int B[1][10], int n, int m, int a[])
{
int i, j, k, x = 0, f1 = 0, f2 = 0;
int F[10], W[1][10];
for (i = 0; i < n; i++)
F[i] = 0;
for (i = 0; i < m; i++)
W[0][i] = B[0][i];
for (k = 0; k < n; k++)
{
for (i = 0; i < n; i++)
{
if (F[i] == 0)
{
f2 = 0;
for (j = 0; j < m; j++){
if (N[i][j] > W[0][j])
f2 = 1;
}
if (f2 == 0 && F[i] == 0)
{
for (j = 0; j < m; j++)
W[0][j] += A[i][j];
F[i] = 1;
f1++;
a[x++] = i;
}
}
}
if (f1 == n)
return 1;
}
return 0;
}
//Resource Request algorithm
void request(int A[10][10], int N[10][10]
, int B[10][10], int pid, int K)
{
int rmat[1][10];
int i;printf("\n Enter additional request : \n");
for (i = 0; i < K; i++)
{
printf(" Request for resource %d : ", i + 1);
scanf("%d", &rmat[0][i]);
}
for (i = 0; i < K; i++)
if (rmat[0][i] > N[pid][i])
{
printf("\n ***Error encountered***\n");
exit(0);
}
for (i = 0; i < K; i++)
if (rmat[0][i] > B[0][i])
{
printf("\n ***Resources unavailable**\n");
exit(0);
}
for (i = 0; i < K; i++)
{
B[0][i] -= rmat[0][i];
A[pid][i] += rmat[0][i];N[pid][i] -= rmat[0][i];
}
}
int banker(int A[][10], int N[][10],
int W[1][10], int n, int m)
{
int j, i, a[10];
j = safety(A, N, W, n, m, a);
if (j != 0)
{
printf("\n\n");
printf("\n A safety sequence has been " "detected.\n");
for (i = 0; i < n; i++)
printf(" P%d ", a[i]);
printf("\n");
return 1;
}
else
{
printf("\n Deadlock has occured.\n");
return 0;
}
}
int main()
{int All[10][10], Max[10][10], Need[10][10]
, W[1][10];
int n, m, pid, c, r;
printf("\n *****DEADLOCK AVOIDANCE USING"
"BANKER'S ALGORITHM*****\n");
Banker(All, Need, Max, W, &n, &m);
r = banker(All, Need, W, n, m);
if (r != 0)
{
printf("\n Do you want make an additional"
"request for any of the process ? (1=Yes|0=No)");
scanf("%d", &c);
if (c == 1)
{
printf("\n Enter process number : ");
scanf("%d", &pid);
request(All, Need, W, pid - 1, m);
r = banker(All, Need, W, n, m);
if (r == 0)
{
exit(0);
}
}
}
else exit(0);
return 0;
}

----------------------

Shard Memory Process


shmclient.c
----------

#include<stdio.h>
#include<sys/ipc.h>
#include<sys/shm.h>

int main()
{
	key_t key = ftok("shmfile",65);
	
	int shmid = shmget(key,1024,0666|IPC_CREAT);
	
	char *str = (char*) shmat(shmid,(void*)0,0);
	
	printf("\nData from server: %s",str);
	
	shmdt(str);
	
	shmctl(shmid,IPC_RMID,NULL);
	
	return 0;
}
-----------


shmserver.c
--------
//Server

#include<stdio.h>

#include<sys/ipc.h>

#include<sys/shm.h>



int main()

{

	key_t key = ftok("shmfile",65);

	

	int shmid = shmget(key,1024,0666|IPC_CREAT);

	

	char *str = (char*) shmat(shmid,(void*)0,0);

	

	printf("\nEnter data to write in shared memory: ");

	gets(str);

	

	printf("\nData written in shared memory: %s",str);

	shmdt(str);

	

	return 0;

}
-----------------

DISK SCHEDULING SSTF,CLOOK,SCAN

-----------
/*
Author : Avinash J Kokare

YouTube Channel link : https://www.youtube.com/c/avinashkokare27

*/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int choice,track,no_req,head,head1,distance;
int disc_req[100],finish[100];
void menu()
{
    printf("\n\n********MENU********");
    printf("\n1. Input data\n 2. SSTF \n 3. SCAN \n 4. C-LOOK \n 5. Exit");
    printf("\n\n Enter your choice");
    scanf("%d",&choice);
}
void input()
{
    int i;
    printf("Enter Total number of tracks");
    scanf("%d",&track);
    printf("Enter total number of disc requests");
    scanf("%d",&no_req);
    printf("\n Enter disc requests in FCFS order");
    for(i=0;i<no_req;i++)
    {
        scanf("%d",&disc_req[i]);
        
    }
    printf("\n Enter current head position");
    scanf("%d",&head1);

}
/*
Author : Avinash J Kokare

YouTube Channel link : https://www.youtube.com/c/avinashkokare27

*/
void sstf()
{
    int min,diff;
    int pending=no_req;
    int i,distance=0,index;
    head=head1;
  
    for(i=0;i<no_req;i++)
    {
        finish[i]=0;
    }

    printf("\n%d=>",head);
    
    while(pending>0)
    {   min=9999;
    
        for(i=0;i<no_req;i++)
        {
            diff=abs(head-disc_req[i]);
            if(finish[i]==0 && diff<min)
            {
                min=diff;
                index=i;
            }
        }
        finish[index]=1;
        distance+=abs(head-disc_req[index]);
        head=disc_req[index];
        pending--;
        printf("%d=>",head);
    }
    printf("End");
    printf("\n\n Total Distance Traversed=%d",distance);
}
/*
Author : Avinash J Kokare

YouTube Channel link : https://www.youtube.com/c/avinashkokare27

*/
void sort()
{
    int i,j,temp;
    for(i=0;i<no_req;i++)
    {
        for(j=0;j<no_req;j++)
        {
            if(disc_req[i]<disc_req[j])
            {
                temp=disc_req[i];
                disc_req[i]=disc_req[j];
                disc_req[j]=temp;
            }
        }
    }
}
void scan()
{
    int index,dir;
    int i;
    distance=0;
    head=head1;
    printf("\n Enter the direction of head \n 1 - Towars higher disc(Right) \n 0 -towards lower disc(left)");
    scanf("%d",&dir);
    sort();
    printf("\n Sorted Disc requests are: ");
    for(i=0;i<no_req;i++)
    {
        
        printf("  %d",disc_req[i]);
    }
    
    i=0;
    while(head>=disc_req[i])
    {
        index=i;
        i++;
    }
    printf("\n index=%d",index);
    printf("\n%d=>",head);
    if(dir==1)
    {
        sort();
        for(i=index+1;i<no_req;i++)
        {
            printf("%d=>",disc_req[i]);
            distance+=abs(head-disc_req[i]);
            head=disc_req[i];          
        }
        distance+=abs(head-(track-1));
        printf("%d=>",track-1);
        head=track-1;
        for(i=index;i>=0;i--)
        {
            printf("%d=>",disc_req[i]);
            distance+=abs(head-disc_req[i]);
            head=disc_req[i];          
        }
    }
    else
    {
        sort();
        for(i=index;i>=0;i--)
        {
            printf("%d=>",disc_req[i]);
            distance+=abs(head-disc_req[i]);
            head=disc_req[i];          
        }
        distance+=abs(head-0);
        head=0;
        printf("0=>");
        for(i=index+1;i<no_req;i++)
        {
            printf("%d=>",disc_req[i]);
            distance+=abs(head-disc_req[i]);
            head=disc_req[i];          
        }
        
    }
    printf("End");
    printf("\n Total Distance Traversed=%d",distance);
    


}
/*
Author : Avinash J Kokare

YouTube Channel link : https://www.youtube.com/c/avinashkokare27

*/
void clook()
{
    int index,dir;
    int i;
    distance=0;
    head=head1;
    printf("\n Enter the direction of head \n 1 - Towars higher disc \n 0 -towards lower disc");
    scanf("%d",&dir);
    sort();
    printf("\n Sorted Disc requests are: ");
    for(i=0;i<no_req;i++)
    {
        
        printf("  %d",disc_req[i]);
    }
    
    i=0;
    while(head>=disc_req[i])
    {
        index=i;
        i++;
    }
    printf("\n index=%d",index);
    printf("\n%d=>",head);
    if(dir==1)
    {
        sort();
        for(i=index+1;i<no_req;i++)
        {
            printf("%d=>",disc_req[i]);
            distance+=abs(head-disc_req[i]);
            head=disc_req[i];          
        }
        for(i=0;i<index;i++)
        {
            printf("%d=>",disc_req[i]);
            distance+=abs(head-disc_req[i]);
            head=disc_req[i];          
        }
    }
    else
    {
        sort();
        for(i=index;i>=0;i--)
        {
            printf("%d=>",disc_req[i]);
            distance+=abs(head-disc_req[i]);
            head=disc_req[i];          
        }
        for(i=(no_req-1);i>index;i--)
        {
            printf("%d=>",disc_req[i]);
            distance+=abs(head-disc_req[i]);
            head=disc_req[i];          
        }
        
    }
    printf("End");
    printf("\n Total Distance Traversed=%d",distance);
}

int main()
{
    while(1)
    {
        menu();
        switch(choice)
        {
        case 1: input();
            break;
        case 2: sstf();
            break;
        case 3: scan();
            break;
        case 4: clook();
            break;
        case 5: exit(0);       
            break;
        default:
            printf("\n Enter valid choice");
            break;
        }
    }

    return 0;
}
----------


Page Replacement Algo

--------------
#include<stdio.h>
int n,nf;
int in[100];
int p[50];
int hit=0;
int i,j,k;
int pgfaultcnt=0;
 
void getData()
{
    printf("\nEnter length of page reference sequence:");
    scanf("%d",&n);
    printf("\nEnter the page reference sequence:");
    for(i=0; i<n; i++)
        scanf("%d",&in[i]);
    printf("\nEnter no of frames:");
    scanf("%d",&nf);
}
 
void initialize()
{
    pgfaultcnt=0;
    for(i=0; i<nf; i++)
        p[i]=9999;
}
 
int isHit(int data)
{
    hit=0;
    for(j=0; j<nf; j++)
    {
        if(p[j]==data)
        {
            hit=1;
            break;
        }
 
    }
 
    return hit;
}
 
int getHitIndex(int data)
{
    int hitind;
    for(k=0; k<nf; k++)
    {
        if(p[k]==data)
        {
            hitind=k;
            break;
        }
    }
    return hitind;
}
 
void dispPages()
{
    for (k=0; k<nf; k++)
    {
        if(p[k]!=9999)
            printf(" %d",p[k]);
    }
 
}
 
void dispPgFaultCnt()
{
    printf("\nTotal no of page faults:%d",pgfaultcnt);
}
 
void fifo()
{
    initialize();
    for(i=0; i<n; i++)
    {
        printf("\nFor %d :",in[i]);
 
        if(isHit(in[i])==0)
        {
 
            for(k=0; k<nf-1; k++)
                p[k]=p[k+1];
 
            p[k]=in[i];
            pgfaultcnt++;
            dispPages();
        }
        else
            printf("No page fault");
    }
    dispPgFaultCnt();
}
 
 
void optimal()
{
    initialize();
    int near[50];
    for(i=0; i<n; i++)
    {
 
        printf("\nFor %d :",in[i]);
 
        if(isHit(in[i])==0)
        {
 
            for(j=0; j<nf; j++)
            {
                int pg=p[j];
                int found=0;
                for(k=i; k<n; k++)
                {
                    if(pg==in[k])
                    {
                        near[j]=k;
                        found=1;
                        break;
                    }
                    else
                        found=0;
                }
                if(!found)
                    near[j]=9999;
            }
            int max=-9999;
            int repindex;
            for(j=0; j<nf; j++)
            {
                if(near[j]>max)
                {
                    max=near[j];
                    repindex=j;
                }
            }
            p[repindex]=in[i];
            pgfaultcnt++;
 
            dispPages();
        }
        else
            printf("No page fault");
    }
    dispPgFaultCnt();
}
 
void lru()
{
    initialize();
 
    int least[50];
    for(i=0; i<n; i++)
    {
 
        printf("\nFor %d :",in[i]);
 
        if(isHit(in[i])==0)
        {
 
            for(j=0; j<nf; j++)
            {
                int pg=p[j];
                int found=0;
                for(k=i-1; k>=0; k--)
                {
                    if(pg==in[k])
                    {
                        least[j]=k;
                        found=1;
                        break;
                    }
                    else
                        found=0;
                }
                if(!found)
                    least[j]=-9999;
            }
            int min=9999;
            int repindex;
            for(j=0; j<nf; j++)
            {
                if(least[j]<min)
                {
                    min=least[j];
                    repindex=j;
                }
            }
            p[repindex]=in[i];
            pgfaultcnt++;
 
            dispPages();
        }
        else
            printf("No page fault!");
    }
    dispPgFaultCnt();
}
 

int main()
{
    int choice;
    while(1)
    {
        printf("\nPage Replacement Algorithms\n1.Enter data\n2.FIFO\n3.Optimal\n4.LRU\n5.Exit\nEnter your choice:");
        scanf("%d",&choice);
        switch(choice)
        {
        case 1:
            getData();
            break;
        case 2:
            fifo();
            break;
        case 3:
            optimal();
            break;
        case 4:
            lru();
            break;
        
        default:
            return 0;
            break;
        }
    }
}

----------------
-----------------
-----------------