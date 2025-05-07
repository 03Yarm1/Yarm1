
@Entry
@Component
struct Day1 {
  private selectedDate: Date = new Date('2021-08-08')
  @State text:string='请选择供应日期'

  build() {

  Column() {
    Row() {
      Tabs() {
        TabContent() {
          Text('待接单')
            .fontSize(20)
        }
        .tabBar('待接单')
        TabContent() {
          Text('已接单')
            .fontSize(20)
        }
        .tabBar('已接单')
      }
      .width('100%')
      .height(50)
    }

    Row() {
      Text(this.text)
        .fontColor(Color.Black)
        .height(50)
        .padding({left: 5})
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date("2000-1-1"),
            end: new Date("2100-12-31"),
            selected: this.selectedDate,
            onAccept: (value: DatePickerResult) => {
              if (value.year!== undefined && value.month!== undefined && value.day!== undefined) {
                // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日期
                this.selectedDate.setFullYear(value.year, value.month, value.day);
                // 格式化日期为年-月-日格式
                const formattedDate = `${value.year.toString().padStart(4, '0')}-${(value.month + 1).toString().padStart(2, '0')}-${value.day.toString().padStart(2, '0')}`;
                console.info("DatePickerDialog:onAccept()" + JSON.stringify(value));
                // 这里假设你有一个变量来显示日期，例如 this.text
                this.text = formattedDate;
              } else {
                console.error('DatePickerResult 中的年、月或日属性未定义');
              }
            },
            onCancel: () => {
              console.info("DatePickerDialog:onCancel()");
            },
            onChange: (value: DatePickerResult) => {
              if (value.year!== undefined && value.month!== undefined && value.day!== undefined) {
                console.info("DatePickerDialog:onChange()" + JSON.stringify(value));
              } else {
                console.error('DatePickerResult 中的年、月或日属性未定义');
              }
            }
          });
        })

      Image($r('app.media.down'))
        .width(18)
        .margin({left: 5, bottom: 3})
    }
    .width('100%')
    .height(50)
    .borderStyle(BorderStyle.Solid)
    .borderColor(Color.Gray)
    .borderWidth({ top: 1 , bottom: 1 })

    Column() {
      Text('当前暂无数据')
        .fontSize(30)
        .width('100%')

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f1f1f1')

  }



  }
}