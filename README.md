# SCGeneratePrettyAvatar

---
###Description
Generate a pretty default avatar, with text on it, and a random flat background color.  

> The text on it depends on the text you input:   
> if 
&nbsp;&nbsp;&nbsp;&nbsp; the first two character includes Chinese, then the text on the image is the first Chinese character,   

> else 
&nbsp;&nbsp;&nbsp;&nbsp; the text on the image is the first two English character.  

---
###Display
![preivew_gif](https://raw.githubusercontent.com/Aevit/SCGeneratePrettyAvatar/master/SCGeneratePrettyAvatarDemo.gif)

---
###How to use
1、copy the folder `SCGeneratePrettyAvatar` to your project, and import it.  

2、write the code like this:  
```
UIImage *image = [SCGeneratePrettyAvatar generateWithText:@"Aevit" imageLength:1024];
```
3、see more details in my demo project.

---
###Thanks
The background colors are from [http://flatuicolors.com/](http://flatuicolors.com/).  

---
###License

This code is distributed under the terms and conditions of the [MIT license](https://raw.githubusercontent.com/Aevit/SCGeneratePrettyAvatar/master/LICENSE). 

