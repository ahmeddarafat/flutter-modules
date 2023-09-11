# The Headings

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6


# Normal Text

you can write normal text without any prefix

# Hyperlinks

You can add a hyperlink in a markdown file by using the below tag.
[link name](targetURL)

Ex: [Github](https://www.github.com "Github home")

# Section Link[Github](https://www.github.com "Github home")

# Italic and Bold Text

_italic text_  Or *italic text*

**bold text**  Or __bold text__

***bold and Italic text***

# StrikeThrough

~~Strike Through text~~

# Images

You can add images in a markdown file by using the below tag.
![imagename](TargetUrl)

Ex: ![boyd](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAfHiaJaqzXDhv-mVG8J1M_UK-6PS8sdtZ4g&usqp=CAU)

# Tables

heading, separator, body

|Name|Email|Address|     
|----|-----|-------|      
|John|john@example.com|Address1| 
|John|john@example.com|Address1| 
|John|john@example.com|Address1| 

# Quotes

>Your quote looks like this.

# Code 

you can put `forEach()` when you want ...

# Code Bloc

```
final routerConfig = GoRouter(
  initialLocation: "/first",
  routes: [
    GoRoute(
      name: "First Page",
      path: '/first',
      builder: (context, state) => const FirstPage(),
      routes: [
        GoRoute(
          name: "Second Page",
          path: 'second',
          builder: (context, state) => const SecondPage(),
        ),
        GoRoute(
          name: "Third Page",
          path: 'third',
          builder: (context, state) => const ThirdPage(),
        ),
      ],
    ),
  ],
);
```

# List

1. Item 1
2. Item 2
3. Item 3
   * Sub item 1
   * Sub item 3
* Unordered item
* Unordered item
* Unordered item



# Scripts

This is a <sup>superscript</sup> text

This is a <sub>subscript</sub> text


# Horizontal line

the lines 
---
***
