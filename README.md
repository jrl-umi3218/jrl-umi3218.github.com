JRL website
===========

[![Build Status](https://travis-ci.org/jrl-umi3218/jrl-umi3218.github.com.svg?branch=master)](https://travis-ci.org/jrl-umi3218/jrl-umi3218.github.com)

## Providing information for the website

The website relies on yaml data to generate most of its content. Most of the
time this all you will need to change to update the website. In this section we
describe the data expected by the website for each data types.

#### Members

| Field | Description | Required |
|-------|-------------|:--------:|
| id | A unique user id, all lower-case is prefered | ✔ |
| given | Given name(s) | ✔ |
| family | Family name | ✔ |
| role | One of: director/deputy-director/permanent/adjunct/engineer/admin/postdoc/phd/master/undergraduate/alumni-star/alumni | ✔ |
| from | Start date of the role in ISO-8601 format | ✔ |
| past-roles | past roles and periods |  |
| nationality | Lower-case [ISO 3166-1 alpha 2 code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements) of the member's nationality | ✔ |
| nationality2 | Lower-case [ISO 3166-1 alpha 2 code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements) of the member's nationality |  |
| nationality3 | Lower-case [ISO 3166-1 alpha 2 code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements) of the member's nationality |  |
| linkedin | Link to the member's linkedin profile      |  |
| webiste  | Link to the member's personal website      |  |
| scholar  | Link to the member's google scholar prefix |  |
| github   | Link to the member's github profile        |  |
| bio | The member's bio (see 1) |  |
| rawbio | The member's bio (raw HTML) |  |
| research | A list of reseach interests (HTML) |  |
| selected_publications | A subset of publications-id |  |
| videos | A list of video entries (see [Video entry](#video_entry)) |  |

Note 1: Biography given through `bio` will start with a title `Bio` and `firstname` `lastname` (in bold). `rawbio` is included as is.

###### Optional asset

If the user's id is `jrlmember`, the site expects to find a picture of the member at the following location: `/en/assets/members/jrlmember.jpg`. Otherwise it will use an anonymous picture.

The image should be `150x200` for the sake of the website's layout.

###### Note

While the `linkedin`, `website`, `scholar` and `github` are all optionals it is mandatory to provide at least 1 to prevent a break of the members' page layout.


#### Publications

*Publications should not be entered by hand: the publication file is generated automatically from [here](https://gite.lirmm.fr/adrien_escande_at_gmail_com/jrl-publi) (private repository)*

| Field | Description | Required |
|-------|-------------|:--------:|
| id | A unique publication id, typically `firstauthor:journal:year` | ✔ |
| year | The publication's year  | ✔ |
| title | The publication's title | ✔ |
| booktitle | The publication's conference or book name | ✔ |
| authors | The publication's list of authors, if the authors is part of the JRL members' database then you should use his/her id otherwise provide given and family entries | ✔ |
| bib | Link to a bib file |  |
| pdf | Link to a pdf file (or any link that could link to the pdf, e.g. HAL or ieeexplore) |  |
| projects | List of related projects' ids |  |

#### Projects

| Field | Description | Required |
|-------|-------------|:--------:|
| id | A unique project id | ✔ |
| title | Project title (typically the acronym e.g. `VERE`) | ✔ |
| longtitle | A more descriptive title (typically the acronym significance e.g `Virtual Embodiment and Robotics Re-Embodiment`) | ✔ |
| year-start | Starting year | ✔ |
| year-end | Ending year | ✔ |
| active | true for active projects, false otherwise | ✔ |
| url | Website of the project |  |
| partners | A list of the projects' partner id |  |
| description | Description of the project (HTML) | ✔ |
| videos | A list of video entries (see [Video entry](#video_entry)) |  |

###### Mandatory asset

For a project whose id is `jrlproject`, a logo is expected at
`/en/assets/projects/jrlproject.png`.

The image resolution should be `700x450`.


###### Note

The `active` property is very important to properly showcase your project on the website's front page.

If the project `active` property is set to `true`:
- the project will appear on the front-page
- the project will be directly listed in the projects menu

If the project `active` property is set to `false`:
- the project will only appear in the `Past projects` page

#### Partners

| Field | Description | Required |
|-------|-------------|:--------:|
| id | A unique partner id | ✔ |
| logo | A link to the partner's logo (for the sake of the website's layout, this logo should be a in square image) | ✔ |
| name | The full name of the partner | ✔ |
| shortname | An abbreviated name |  |
| website | A link to the partner's website | ✔ |


#### Video entry<a name="video_entry"></a>

| Field | Description | Required |
|-------|-------------|:--------:|
| title | Video title | ✔ |
| url | Video url (youtube-only) | ✔ |
| img | Image used for the vignette (`http://i1.ytimg.com/vi/[YOURVIDEOHASH]/mqdefault.jpg` can be used) | ✔ |

## Creating a new page

Normally, providing the additional information is enough to display it on the website. An additional step is required for two operations:
1. Create a member's page
2. Create a project's page

#### Create a member page

In the following example, the user id is `jrlmember`.

- Create a new page named `member-jrlmember.html` in `en/members/`
- Put the following content

```
---
layout: default
---
{% include member_full.html id="jrlmember" %}
```

- (optional) Add pictures to the carousel by puting pictures in the `en/assets/members/jrlmember/` folder (note: the picture wil appear in their alphabetical order)

The page will display:
- A carousel including the member's picture and all pictures added in step 3
- The content of the `bio` entry
- A video gallery corresponding to the `videos` entry
- Either the full list of publications or a list of selected publications and the full (hidden by default) list of publications.

### Create a project page

In the following example, the project id is `jrlproject`.

- Create a new page named `project-jrlproject.html` in `/en/projects/`
- Put the following content

```
---
layout: default
---
{% include project.html id="jrl-project" %}
```

- (optional) Add pictures to the carousel by putting pictures in the `en/assets/projects/jrlproject/` folder (note: the picture will appear in their alphabetical order)

The page will display:
- A carousel including ll pictures added in step 3 or the project logo if no pictures were added
- The content of the `description` entry
- A video gallery corresponding to the `videos` entry
- The full list of publications related to the project
- A list of partners in the project

## Testing locally

In order to test your modifications locally before pushing to GitHub, install
`jekyll` according to the instructions in https://jekyllrb.com/docs/installation/, and run the following command at the root of the project folder:

```sh
$ bundle exec jekyll server --safe --trace
```
**Note** on Ubuntu 18.04 and earlier, you will need probably to uninstall the Jekyll version installed by apt. <br/>
**Note** If you're getting the error `ERROR /favicon.ico not found`, remove the `--safe`.

You will get something like:

```
Configuration file: /path/to/jrl-umi3218.github.com/_config.yml
           Source:  /path/to/jrl-umi3218.github.com
       Destination: /path/to/jrl-umi3218.github.com/_site
      Generating...
                    done.
Configuration file: /path/to/jrl-umi3218.github.com/_config.yml
    Server address: http://0.0.0.0:4000/
  Server running... press ctrl-c to stop
```

Then simply type the server address in your browser (`http://0.0.0.0:4000/`
here).

### With Docker

1. Install Docker on your system
2. Create the image, e.g. `docker build -t jekyll`
3. Serve `docker run --rm -p 4000:4000 -v $(pwd):/site jekyll serve --trace -H 0.0.0.0`

You can now browse the website in your browser at http://localhost:4000

## Deploy

To deploy to AIST server, first build the site with `baseurl` to `/jrl-22022`:
```
bundle exec jekyll build -b /jrl-22022
```
Then upload the folder `_site/jp` and the folder `_site/en` using `FTP over Explicit SSL/TLS`

## Jekyll theme

We use the [startbootstrap-modern-business](https://github.com/BlackrockDigital/startbootstrap-modern-business).
