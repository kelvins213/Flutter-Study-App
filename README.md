# Study App With Flutter


## Context 

Guys, I was given the following task to accomplish: I had to implement one of the screens in a study app, which my team is developing with ```Flutter```. This screen must have the subjects’ contents, like stuff from math, history, geography, etc. So, I coded, and the result was this one: 

<div style="display: flex; justify-content: space-between;" align="center">
  <img src="https://user-images.githubusercontent.com/103438311/205446721-8190d63a-a32b-46ec-a7e4-951d6027f944.png" width="250px"/>  
  <img src="https://user-images.githubusercontent.com/103438311/205446714-92b60179-10df-4f32-871f-ec6aa01db8a4.png" width="250px"/>  
  <img src="https://user-images.githubusercontent.com/103438311/205446719-9f0ee61c-69bc-4f84-b826-edcf7c8131d8.png" width="250px"/>  
</div>

## Explanacion

If you click on *PORTUGUÊS*, the app must show a new screen with the *PORTUGUÊS* contents, and this goes for the others too. Because of this logic, I realized that I still had a lot of work to do. I would have to implement uncountables screens for each subject, in order to show in each one the following subject content. With this in mind, I worked out a solution to make this process ```dynamically```, so I could finish the task faster, without having to create a lot of screens.

## Solution

For this to work, I thought I could actually show for the user always the same screen, but also always ```changing the parameters``` according to the subject. No matter what button the user clicked, like *HISTÓRIA*, *GEOGRAFIA* or *SOCIOLOGIA*, the app would always show the same screen, but with the following parameters. In this case, if he clicks on *SOCIOLOGIA*, he will see a page with the contents of SOCIOLOGIA, but in case he clicks on *HISTÓRIA*, he will see the same page, but with the HISTÓRIA parameters, and I got this result: 


<div style="display: flex; flex-direction: column;" align="center">
  <img src="https://user-images.githubusercontent.com/103438311/205445828-05cdf442-5b8c-471c-94e5-ae7f572ee2e3.png" width="250px"/>  
  <img src="https://user-images.githubusercontent.com/103438311/205445830-4f74ff89-95f6-4f63-89b7-202a63ff3871.png" width="250px"/>  
  <img src="https://user-images.githubusercontent.com/103438311/205445831-3993affe-a54e-4abd-ae9e-571413846df3.png" width="250px"/>  
</div>

## Code Logic

Talking about the code itself, I worked out a logic based on the ```creation of objects and arrays``` of them. Each subject, like *PORTUGUÊS* and *MATEMÁTICA*, had their own corresponding array of objects. Meaning, if you click on *PORTUGUÊS* button, the ElevatedButton widget will send for the onPressed method an array with a bunch of objects that had the contents of *PORTUGUÊS* in theirs attributes, and this goes for *MATEMÁTICA* and the others too. So the following page, which is above, could get the right contents. Besides, I also implemented other resources for this to work, like a ```Listview.builder```, to read all the positions from the arrays’ objects; a domain file and two database files, which, together, do the creation of the objects and their arrays.

Using the same logic, I continued coding, in order to show the topic's contents. In the image above, I clicked on *ÉMILE DURKHEIM*, *ERA PALEOLÍTICA* and *GEOMETRIA PLANA*, and got the result:

<div style="display: flex; flex-direction: column;" align="center">
  <img src="https://user-images.githubusercontent.com/103438311/205445832-f4cfd822-a72c-46fc-90c4-94988e36f4e0.png" width="250px"/>  
  <img src="https://user-images.githubusercontent.com/103438311/205445833-c4e2f559-4952-4d11-bdd8-96ade3ba4827.png" width="250px"/>  
  <img src="https://user-images.githubusercontent.com/103438311/205445834-cc607744-f2a9-44aa-9bda-b9083ec9a356.png" width="250px"/>  
</div>

## Conclusion

Once finished, I realized I had learnt so much, like ```fundamentals of Flutter```, ```fundamentals of front-end```, ```practicing on arrays manipulation```, ```objects’ instantiation```, things with ```integrated mysql database```, ```json files``` and ```asynchronous programming```. Therefore, I accomplished my mission. 

https://user-images.githubusercontent.com/103438311/205449297-8a5c656c-da20-420e-bba3-0de7b69b3caf.mp4

## Thanks, everyone!

>The source code is avaliable on ```branch main.```
