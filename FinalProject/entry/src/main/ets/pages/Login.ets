//登录页


@Entry
@Component
struct Login {

  pathStack: NavPathStack = new NavPathStack();//页面跳转相关 不要删

  aboutToAppear() {
    AppStorage.setOrCreate("pathStack", this.pathStack); // 存入全局 页面跳转相关 不要删
  }

    login(result: boolean): void {
    //可以修改这个login的逻辑 比如账密正确才可以登录 但是在允许登陆的时候一定要有这句
    //这句命令可以跳转到主页面
    this.pathStack.pushPathByName('MainPages', this.pathStack);
  }

  build() {
    Navigation(this.pathStack){//不要删掉这个navigation 这个是用来页面跳转的
      Column(){
        Text('这是登录页面')
          .fontColor('#007DFF')
          .fontSize('16fp')
          .fontWeight(FontWeight.Medium)

        Button('login')
          .width('90%')
          .height('40vp')
          .fontSize('16fp')
          .backgroundColor('#007DFF')
          .onClick(() => {
            this.login(true);
          })//暂定这个是登录按钮，如果换了其他登录按钮，要在新的登录按钮加onClick这个属性
      }
    }
    .backgroundColor('#F1F3F5')
    .width('100%')
    .height('100%')
    .hideTitleBar(true)
    .hideToolBar(true)
  }
}