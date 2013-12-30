//
//  CoreDataViewController.m
//  loadDemo
//
//  Created by Wei Wang on 12/25/13.
//  Copyright (c) 2013 tagged. All rights reserved.
//

#import "CoreDataViewController.h"
#import "AppDelegate.h"
#import "Entity.h"


@interface CoreDataViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *team;
@property (weak, nonatomic) IBOutlet UITextField *num;
@property (weak, nonatomic) IBOutlet UIButton *save;
@property (weak, nonatomic) IBOutlet UIButton *query;
@property (nonatomic, weak) AppDelegate *myDelegate;
@property (nonatomic, strong)NSMutableArray *EntityArray;

@end

@implementation CoreDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignKeyBoard:)];
    [self.view addGestureRecognizer:tap];
    
    self.myDelegate = [UIApplication sharedApplication].delegate;
    self.name.clearsOnBeginEditing = YES;
    self.team.clearsOnBeginEditing = YES;
    self.num.clearsOnBeginEditing  = YES;
    
    self.title = @"Add";
}

- (void)resignKeyBoard:(id) sender {

    [self.name resignFirstResponder];
    [self.team resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    
    [self.name resignFirstResponder];
    [self.team resignFirstResponder];
    [self.num  resignFirstResponder];
    Entity *entity = [NSEntityDescription insertNewObjectForEntityForName:@"Entity" inManagedObjectContext:self.myDelegate.manageObjectContext];
    [entity setName:self.name.text];
    [entity setTeam:self.team.text];
    [entity setNumber:self.num.text];
    
    NSError *error;
    
    BOOL isSuccess = [self.myDelegate.manageObjectContext save:&error];
    if (!isSuccess) {
        NSLog(@"Error : %@ ,%@",error,[error userInfo]);
    } else {
        NSLog(@"Save successfully!");
    }
    
}

- (IBAction)query:(id)sender {
    [self.name resignFirstResponder];
    [self.team resignFirstResponder];
    [self.num  resignFirstResponder];
    
    //创建取回数据请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    //设置要检索哪种类型的实体对象
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Entity"inManagedObjectContext:self.myDelegate.manageObjectContext];
    //设置请求实体
    [request setEntity:entity];
    
    //指定对结果的排序方式
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"number"ascending:YES];
    NSArray *sortDescriptions = [[NSArray alloc]initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptions];
    
    NSError *error = nil;
    //执行获取数据请求，返回数组
    NSMutableArray *mutableFetchResult = [[self.myDelegate.manageObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResult == nil) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }
    
    NSLog(@"The count of entry:%i",[mutableFetchResult count]);
    self.EntityArray = [[NSMutableArray alloc] initWithArray:mutableFetchResult];
    for (Entity *entry in mutableFetchResult) {
        NSLog(@"Name:%@---Team:%@---Number:%@",entry.name,entry.team,entry.number);
    }
    PlayerListViewController *playerList = [[PlayerListViewController alloc] init];
    playerList.dataArray = mutableFetchResult;
   // playerList.delegate = self;
    [self.navigationController pushViewController:playerList animated:YES];

    
}

- (IBAction)delete:(id)sender {
    
    NSLog(@"%s",__func__);
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Entity" inManagedObjectContext:self.myDelegate.manageObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSLog(@"== %@",self.name.text);
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"name == %@",self.name.text];
    [request setPredicate:pred];
    [request setFetchLimit:1];
    
    NSError *error = NULL;
    NSArray *array = [self.myDelegate.manageObjectContext executeFetchRequest:request error:&error];
    if (array.count != 0) {
        for (Entity *entity in array) {
            NSLog(@"<><><><><><> %@",entity.name);
        }
    }
    if (error != NULL) {
        NSLog(@"Error %@,%@",error,[error userInfo]);
    }
    
}
@end
