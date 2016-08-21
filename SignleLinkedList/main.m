//
//  main.m
//  SignleLinkedList
//
//  Created by 二哈 on 16/8/21.
//  Copyright © 2016年 侯森魁. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <stdio.h>
#include <stdlib.h>

//定义结点类型
struct node
{
    //结构体内不能赋值
    int num;
    char name[50];
    char address[150];
    struct node *next;
};
//struct node 这是一个非常特殊的数据类型，在尚未定义好，就去使用。

//函数声明
struct node *CreatNode(struct node *);

void Print(struct node *);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        struct node *head = NULL;
        
        head = CreatNode(head);
        
        Print(head);
        
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
//续上，创建单向链表
//创建单向链表函数
struct node *CreatNode(struct node *head)
{
    struct node *p1,*p2;
    
    p1=p2=(struct node *)malloc(sizeof(struct node));
    
    printf("请输入编号，编号输入小于等于0结束：\n");
    scanf("%d",&p1->num);
    
    printf("请输入姓名：\n");
    scanf("%s",p1->name);
    
    getchar();//把回车去掉，以方便下面的gets能读取正确的数
    
    printf("请输入地址：\n");
    fgets(p1->address,149,stdin); //安全起见使用用fgets,可以读取空格等字符,
    p1->next = NULL;
    
    while(p1->num > 0)
    {
        if(head == NULL)
            head = p1;
        else
            p2->next = p1;
        p2 = p1;
        p1 = (struct node *)malloc(sizeof(struct node));
        
        printf("请继续输入编号，编号输入小于等于0结束：\n");
        scanf("%d",&p1->num);
        
        printf("请输入姓名：\n");
        scanf("%s",p1->name);
        getchar(); //把回车去掉，以方便下面的fgets能读取正确的数
        printf("请输入地址：\n");
        fgets(p1->address,149,stdin);
    }
    free(p1);  //申请到的没录入，所以释放掉
    p1=NULL;   //使指向空
    p2->next = NULL; //到表尾了，指向空
    printf("\nhwhw\n");
    return head;
}
//打印链表函数
void Print(struct node *head)
{
    struct node *temp;
    temp = head;
    
    while(temp != NULL)
    {
        printf("%d,  %s,  %s\n",temp->num,temp->name,temp->address);
        temp = temp->next;
    }
    
}