/* companies */
company(sumsum).
company(appy).

/* information about business */
smart_phone_technology(galactica_s3).
business(X) :-
    smart_phone_technology(X).

/* relationships between companies */
competitor(sumsum, appy).

rival(X, Y):-
    competitor(X, Y).
rival(X, Y):-
    competitor(Y, X).


/* sumsum had developed the smart phone technology galactica_s3 */
developed(sumsum, galactica_s3).

/* information about Stevey */
person(stevey).
boss(stevey, appy).

/* Stevey had stolen galactica_s3 from sumsum */
steal(stevey, galactica_s3, sumsum).

/* A person can be deemed unethical if they are the boss of a company and they steal a business from another company which is a rival of their company*/

unethical(Person) :-
    boss(Person, Company),
    steal(Person, Business, OtherCompany),
    rival(Company, OtherCompany),
    business(Business).


