require 'prime'

class MersenController < ApplicationController
  def input
    render layout: false
  end

  def view
    num= params[:val].to_i
    count=0
    arr=[]
    if !(num.is_a?(Integer))
      nil
    elsif num < 0 
      nil
    else
    1.upto(num) do |s|
      temp=mersen?(s)
      if Prime.prime?(s)==true and temp>0 and Prime.prime?(temp)==true
        arr.push([count+=1, s])
      end
    end
    end
    @result = arr
    @count = count
    respond_to do |format|
      format.html 
      format.json do
        render json:
          {type: @result.class.to_s, value: @result}
          {type: @count.class.to_s, value: @count}
      end
    end
  end

  private

  def mersen?(n)
    m=0
    if (n+1).to_s(2).count('1') == 1
      m=(n+1).to_s(2).count('0')
    end
    return m
  end

end
