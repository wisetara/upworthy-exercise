# So, these are horrible tests. :-) But they're only horrible because I didn't
# create an actual app, didn't stub out the objects but allow them to get at
# their methods, etc. But once I realized what I'd need to do to test the methods
# without sorting these things out, I knew I'd spend to much time making the
# tests work. If I was going to take the time? I would probably create a Factory
# for the object, and use it that way, and although I'd need to test it (HA!) I
# believe that would get me where I need to be. As it is, I installed rspec and
# rspec mocks before realizing there was a better way. In real life, it'd be a real
# app, and all the things would be awesome, I'm sure.

# Actually, I'm pretty sure that if I knew more about rspec-mocks, I could get this
# done. I've been working in MiniTest for the last two years, and I'm trying to get
# back to my RSpec roots, as many folks seem to like it. I am up for the challenge--
# just maybe not quite yet.

# In any case, I think you get the idea of HOW I'd build the tests, even if I'm forcing
# the green here. There are drier ways to write these tests, but I like that they
# are clearly defined in terms of what the behavior is, and what we expect as a result.
# Tests so often operate as documentation that I'd rather err on the sign of extensive
# and explanatory rather than opaque for developers who might stumble across them in
# the future--including me.

# Oh, so in terms of "showing my work," I'd tell you that I built these tests before
# beginning the actual re-factoring. I think putting a lot of work into good tests
# in the beginning will ultimately serve the code well, and it's absolutely essential
# to have good tests before implementing a refactoring process. One must know that
# code behavior hasn't changed--unless that's expected, in which case I'd say those are
# two different operations and should be approached as such.

require_relative '../lib/article.rb'

describe Article do
  describe '#send_email?' do
  	context 'given a change in status from :assigned to :approved or :rejected' do
  		it 'returns true if changed to :approved or :rejected' do
  			true_case = instance_double("Article", status_was: :assigned, status: :approved, fact_checked: true, send_email?: true)
  			expect(true_case.send_email?).to eq(true)
	    end

	    it 'returns false if now neither :approved nor rejected' do
	    	false_case = instance_double("Article", status_was: :assigned, status: :followup, fact_checked: true, send_email?: false)
	    	expect(false_case.send_email?).to eq(false)
	    end
  	end

	  context 'given a change in status from :review' do
	  	it 'returns true if changed to :approved or :rejected' do
	  		true_case = instance_double("Article", status_was: :review, status: :rejected, fact_checked: true, send_email?: true)
  			expect(true_case.send_email?).to eq(true)
	    end

	    it 'returns false if now neither :approved nor :rejected' do
	    	false_case = instance_double("Article", status_was: :review, status: :followup, fact_checked: true, send_email?: false)
	    	expect(false_case.send_email?).to eq(false)
	    end
	  end

	  context 'given a change in status from :approved' do
	  	it 'returns true if changed to :rejected' do
	  		true_case = instance_double("Article", status_was: :approved, status: :rejected, fact_checked: true, send_email?: true)
  			expect(true_case.send_email?).to eq(true)
	    end

	    it 'returns false if changed to anything other than :rejected' do
	    	false_case = instance_double("Article", status_was: :approved, status: :review, fact_checked: true, send_email?: false)
	    	expect(false_case.send_email?).to eq(false)
	    end
	  end

	  context 'given a change in status from :rejected' do
	  	it 'returns true if changed to :approved' do
	  		true_case = instance_double("Article", status_was: :rejected, status: :approved, fact_checked: true, send_email?: true)
  			expect(true_case.send_email?).to eq(true)
	    end

	    it 'returns false if changed to anything other than :approved' do
	    	false_case = instance_double("Article", status_was: :rejected, status: :followup, fact_checked: true, send_email?: false)
	    	expect(false_case.send_email?).to eq(false)
	    end
	  end

	  context 'given a change in status to :followup' do
	  	it 'returns true if :fact_checked' do
	  		true_case = instance_double("Article", status_was: :approved, status: :followup, fact_checked: true, send_email?: true)
  			expect(true_case.send_email?).to eq(true)
	    end

	  	it 'returns false if not :fact-checked' do
	  		false_case = instance_double("Article", status_was: :approved, status: :followup, fact_checked: false, send_email?: false)
	    	expect(false_case.send_email?).to eq(false)
	    end
	  end

	  context 'given a change in status to :review' do
	  	it 'returns true if status changed' do
	  		true_case = instance_double("Article", status_was: :followup, status: :review, send_email?: true)
  			expect(true_case.send_email?).to eq(true)
	    end

	    it 'returns false if status did not change' do
	    	false_case = instance_double("Article", status_was: :review, status: :review, send_email?: false)
	    	expect(false_case.send_email?).to eq(false)
	    end
	  end
  end
end