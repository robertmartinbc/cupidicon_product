class Assignment < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :transactions
  has_many :submissions
  attr_accessible :body, :category, :cost, :instructions, :key_words, :language, :rating, :style, :title, :word_count, :description

  default_scope order('created_at DESC')

  def self.published
    where(state: 6)
  end

  def self.authorize
    where(state: 3)
  end

  def self.revision
    where(state: 4)
  end

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true  
  validates :user, presence: true

  state_machine initial: :open do
    state :open, value: 0
    state :review, value: 1
    state :write, value: 2
    state :authorize, value: 3
    state :revision, value: 4
    state :resubmit, value: 5   
    state :published, value: 6

  event :review do
      transition :open => :review
    end

    event :renew do 
      transition :review => :open
    end
   
    event :write do 
      transition :review => :write
    end

    event :cancel do 
      transition :write => :open
    end

    event :authorize do 
      transition :write => :authorize
    end

    event :published do
      transition :authorize => :published
    end

    event :reject do 
      transition :authorize => :open
    end

    event :revision do
      transition :authorize => :revision
    end

    event :resubmit do
      transition :revision => :resubmit
    end

    event :revision do
      transition :resubmit => :revision
    end

    event :published do
      transition :resubmit => :published
    end

    event :cancel do 
      transition :revision => :open
    end

    event :reject do 
      transition :resubmit => :open
    end  
  end
end
