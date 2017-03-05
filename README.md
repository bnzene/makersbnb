# Makersbnb

Team project guided by XP values and Agile principles.

### 1. High level description of specification
===================
We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

#### Headline specifications

Any signed-up user can list a new space.
Users can list multiple spaces.
Users should be able to name their space, provide a short description of the space, and a price per night.
Users should be able to offer a range of dates where their space is available.
Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
Nights for which a space has already been booked should not be available for users to book that space.
Until a user has confirmed a booking request, that space can still be booked for that night.

#### Nice-to-haves

Users should receive an email whenever one of the following happens:

* They sign up

* They create a space

* They update a space

* A user requests to book their space

* They confirm a request

* They request to book a space

* Their request to book a space is confirmed

* Their request to book a space is denied

Users should receive a text message to a provided number whenever one of the following happens:

* A user requests to book their space

* Their request to book a space is confirmed

* Their request to book a space is denied

* A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space

* Basic payment implementation though Stripe.


### 2. User Stories
===================
##### (searching for spaces to rent)
```
1)
As a user
So I can sign up on the homepage
I want to sign up for an account with my email address and password

2)
As a signed-up user
So I can use the website
I want to be able to login with my login details

3)
As a signed-up user
I want to view a list of spaces

4)
As a signed-up user
I want to view a space in more detail

5)
As a signed-up user
I want to be able to request to hire a space

##### (renting out spaces)

6)
As a signed-up user
So I can offer my space
I need to be able to list a new space with name, description and price/night.

<!-- As a signed-up user

7)
As a signed-up user
I want to be notified of requests to hire my spaces

8)
As a signed-up user
So I can not get murdered
I want to be able to approve or refuse requests to hire a space

9)
So I can offer my space
I need to be able to add available dates for each space. -->

```

### 3. Outline of MVP
===================
1. User can sign in or sign up
2. User can view spaces with details
3. User can request to use spaces
4. User can list multiple spaces
5. User can view, approve or refuse requests to use spaces
