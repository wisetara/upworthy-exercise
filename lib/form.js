<!DOCTYPE html>
<head>
	<title>Is This Your Email Address?</title>
</head>
<body>
	<div>
		<form id="email-form" method="post" action="/submit_email" name="email-form">
		  <input type="email" id="email-field" name="email" placeholder="Email Address">
		  <input type="submit" id="email-submit" value="Submit" onClick="ValidateEmail(document.email-form.email)">
		</form>
	</div>
</body>

function ValidateEmail(input)
{
	var valid = false;
	// No regex that I've found is completely successful at validating all the possible emails. But this
	// one will do pretty good.
	var format = /\A\S+@.+\.\S+\z/;
	if(input.value.match(format))
		{
			//I would not actually include an alert. But there's no place for this form to go, so I went for it.
			alert("You know your email address! This is amazing! \n No one likes these text boxes. I'm sorry.");
			valid = true;
		}
	else
		{
			alert("Your email might be invalid. Wanna try again?");
			email-form.email.focus();
			valid = false;
		}
}

// For a (possibly unit or functional, depending on what else is happening) test, I'd do something like this:

feature 'User visits the page with the form' do
  context 'they see the email form on the page and can submit a valid email' do
    visit email_form_path

    fill_in 'email', with: 'tara@gmail.com'
    click_button 'Submit'

    // I'd build some CSS, ideally that would have maybe a different background color depending
    // on whether the email went okay.
    expect(page).to have_css '.good-email', 'Good Email'
  end

  context 'they see the email form on the page and an invalid email returns them to the field' do
    visit email_form_path

    fill_in 'email', with: 'tara@gmail' // invalid email
    click_button 'Submit'

    // This is just a basic example. I could confirm that it focuses back on the email field
    // (see below note). Or any number of things, depending on what I did that was better than
    // those alerts! :-)
    expect(page).to have_css '.bad-email', 'Bad Email'
  end
end

// I'd probably use Capybara, Cucumber, and possibly Selenium to test the actual JS. I don't
// have a great deal of experience testing javascript, so I'd hope that someone would pair with
// me on that.