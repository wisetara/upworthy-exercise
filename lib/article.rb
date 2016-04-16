# Refactor its `send_email` method as best as you can to reduce complexity and improve the
# maintainability of the method. Document any assumptions you make.

class Article
  def status_was
  end

  def status
  end

  def fact_checked
  end

  def send_email?
    # Send the email only if the article's status changes in these exact ways:
    if self.status_was == :assigned && (self.status == :approved || self.status == :rejected)
      true
    elsif self.status_was == :review && (self.status == :approved || self.status == :rejected)
      true
    elsif self.status_was == :approved && self.status == :rejected
      true
    elsif self.status_was == :rejected && self.status == :approved
      true
    elsif self.status_was != :followup && self.status == :followup && self.fact_checked?
      true
    elsif self.status_was != :review && self.status == :review
      true
    else
      false
    end
  end

  # # # # # # #

  def send_email_basic_refactor_1
    return true if self.status_was == :assigned && (self.status == :approved || self.status == :rejected)
    return true if self.status_was == :review && (self.status == :approved || self.status == :rejected)
    return true if self.status_was == :approved && self.status == :rejected
    return true if self.status_was == :rejected && self.status == :approved
    return true if self.status_was != :followup && self.status == :followup && self.fact_checked?
    return true if self.status_was != :review && self.status == :review
  end

  # # # # # # #

  # The key to re-factoring is making small changes one at a time. So, that's how I'd start. Now, it
  # could be that a good pattern is obvious (given what else one knows about the code), but in the
  # unknown, small, incremental changes are the way to go.

  def send_email_small_refactor
    return true if self.status_was == :assigned && (self.status == :approved || self.status == :rejected)
    return true if self.status_was == :review && (self.status == :approved || self.status == :rejected)
    return true if self.status_was == :approved && self.status == :rejected
    return true if self.status_was == :rejected && self.status == :approved
    return true if self.status_changed? && self.status == :followup && self.fact_checked?
    return true if self.status_changed? && self.status == :review
  end

  def status_changed?
    self.status_was != self.status
  end

  # # # # # # #

  # Here's another small refactor:

  def send_email_small_refactor
    return true if self.status_was == :assigned && self.approved_or_rejected
    return true if self.status_was == :review && self.approved_or_rejected
    return true if self.status_was == :approved && self.status == :rejected
    return true if self.status_was == :rejected && self.status == :approved
    return true if self.status_changed? && self.status == :followup && self.fact_checked?
    return true if self.status_changed? && self.status == :review
  end

  def status_changed?
    self.status_was != self.status
  end

  def approved_or_rejected
    self.status == :approved || :rejected
  end

  # # # # # # #

  # As things start to shape up, one realizes (perhaps), hey! We could make this even cleaner.

  def send_email_with_special_methods
    return true if self.status_was == :assigned && self.approved_or_rejected
    return true if self.status_was == :review && self.approved_or_rejected
    return true if self.status_was == :approved && self.rejected
    return true if self.status_was == :rejected && self.approved
    return true if self.status_changed? && self.followup && self.fact_checked?
    return true if self.status_changed? && self.review
  end

  def status_changed?
    self.status_was != self.status
  end

  def approved_or_rejected
    self.status == :approved || :rejected
  end

  def approved
    self.status == :approved
  end

  def rejected
    self.status == :rejected
  end

  def followup
    self.status == :followup
  end

  def review
    self.status == :review
  end

  # # # # # # #
end

# Those are only some basic refactorings. Obviously, one could do similar things with
# `status_was` statuses. Or, perhaps someone sees all of these methods and says, "You know,
# we could have an ArticleStatus class where things happen that make this a lot easier."

# Alternate refacorings I didn't include but could have (with more time): Name each conditional
# as its own method, compartmentalizing the criteria in each, moving complex lines into individual
# methods but having the lengthy conditionals just calling the well-named methods.