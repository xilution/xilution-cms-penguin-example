Feature("Landing Page");

Scenario("test landing page", (I) => {
    I.amOnPage("/");
    I.see("Hello world!");
    I.see("Welcome to WordPress.");
});
